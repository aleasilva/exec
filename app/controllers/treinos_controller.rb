require "date"

class TreinosController < ApplicationController
  #before_filter :authenticate_user!, :except => [:index]
  before_action :set_treino, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource #cancan

  def edit
     @atividadesAerobico =  Atividadetreino.joins("JOIN atividades on atividadetreinos.atividade_id = atividades.id").
                                                  where("atividades.tipo = ? And atividadetreinos.treino_id = ?", 'A', params[:id]  )

    callInjectOrdens()

  end

  def new
    @treino = Treino.new
    @treino.aluno_id = params[:aluno]
    @treino.validade = Date.today + 60
    @treino.criacao = Date.today
    @aluno = Aluno.find(params[:aluno])

    Musculo.all.each do |m|
      @treino.ordemmusculotreinos.build(:musculo_id => m.id )
    end

    Atividade.where(tipo: 'A').each do |aa|
      @treino.atividadetreinos.build(:atividade_id => aa.id)
    end
    @atividadesAerobico = @treino.atividadetreinos

    callInjectOrdens()

  end

  def show

  end

  def destroy
    @treino.destroy
    respond_to do |format|
      format.html { redirect_to alunos_url }
      format.json { head :no_content }
    end
  end

  def create
    @treino = Treino.new(treino_params)
    @treino.aluno_id = params[:alunoId]

    respond_to do |format|
      if @treino.save
        format.html { redirect_to @treino, notice: 'Treino criado.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /musculos/1
  # PATCH/PUT /musculos/1.json
  def update

    if not params[:treino][:atividade_ids].present?
      params[:treino][:atividade_ids] = []
    end

    #Recuperar os valores do array de array.
    #Tratamento  para evitar o erro na atualizacao do treinos.Estava excluindo as atividades do treino Muscular.
    @result =  Atividadetreino.joins('JOIN atividades on atividadetreinos.atividade_id = atividades.id').where('atividades.tipo' => 'A')
    @result.each do |res|
       params[:treino][:atividade_ids].push(res.atividade_id)
    end

    #********************************************
    #Gravando as ordens para os Treinos Aerobicos
    #********************************************
    setOrdensTreinos(:aerobico)

    #********************************************
    #Gravando as ordens para os Treinos Neurologicos
    #********************************************
    setOrdensTreinos(:neuro)

    respond_to do |format|
      if  @treino.update(treino_params)
        format.html { redirect_to @treino, notice: 'Treino atualizado!' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  ####
  #Faz gravaçao dos dados e volta para a tela para impressao
  #
  def confirmaTreino
    alunoId = params[:alunoId]
    sAdapta = params[:semana_adaptacao]
    lTreino = params[:last_treino]

    case params[:treinoAcao]
      when "print"
        redirect_to printTreino_path({ :doPrint => 'true',
                                       :alunoId => alunoId,
                                       :semana_adaptacao => sAdapta,
                                       :last_treino => lTreino})
      when "mail"
        print(alunoId)
        AlunoTreinoMailer.treino_email(alunoId,params).deliver
        flash[:info] = 'Seu treino de hoje foi enviado ao seu e-mail. Obrigado!'
        redirect_to root_path
      else
        aluno = Aluno.find(alunoId)

        if aluno != nil
          aluno.registraPresenca()
          flash[:info] = 'Sua presença foi registrada. Obrigado!'
          redirect_to root_path
        else

        end
    end

  end

  #Metodos de controle de impressao do treino.
  def printIndex
    @alunos = Aluno.all
    @alunos_grid = initialize_grid(@alunos)
  end

  def print(pIdAluno = "")

      begin
        if params[:idacademia].present?
          @aluno = Aluno.find(params[:idacademia])
        else
          @aluno = Aluno.find(params[:alunoId])
        end

        #@aluno = Aluno.where("idacademia = ? ", params[:idacademia]).first()

        treinos = Treino.where("aluno_id = ? and ? between criacao and validade", @aluno.id ,Date.today)

        if treinos.exists?
          @treino = treinos.first

          #Localizando qual ordem de treino será executada "Treino A,B,C etc.."
          retTreino = @treino.getTreinoExercicios(@aluno, treinos)
          @treinoOrdem = retTreino[0]
          #@treinoOrdemItem = retTreino[1]

          #Localizando a adaptacao
          retAdaptacao = @aluno.setAdaptacaoAtual(@treino)
          @semanaTreino = retAdaptacao[1]
          @adaptcaoAtual = retAdaptacao[0]

          #if @semanaTreino == -1
          #  flash[:alert] = 'A sua semana de treino está fora de sequencia, por favor, procure o seu professor.'
          #  redirect_to root_path
          #end

          #Verifico a confirmacao da impressao.
          if params.include?("doPrint") and
            if @aluno.data_ultimo_treino != Date.today
              @aluno.atualizaStatusTreino(params)
            end

            @aluno.registraPresenca()
          end

        else
          flash[:alert] = 'Não foi localizado um treino para você, por favor, procure seu professor.'
          redirect_to root_path
        end

      rescue ActiveRecord::RecordNotFound => e
         flash[:alert] = 'Não foi encontrado um aluno(a) com o código informado, por favor, tente novamente. <br/>'.concat(e.to_s).html_safe
         redirect_to root_path

      #rescue Exception => e

      end

  end

  def procurar(atividade)
    eof = @treino.atividades.include?(atividade)
  end
  helper_method :procurar

  # Use callbacks to share common setup or constraints between actions.
  private
  def set_treino
    @treino = Treino.find(params[:id])
    @aluno = Aluno.find(@treino.aluno_id)

    #Rails.logger.info("SET TREINO")
  end

  def setOrdensTreinos(tipo)

    #Recupero os relacionamentos que contem os campos para gravacao da ordem.
    if(tipo == :aerobico)
      lstOrdensTreino = params[:treino][:atividadetreinos_attributes]
    elsif (tipo == :neuro)
      lstOrdensTreino = params[:treino][:ordemmusculotreinos_attributes]
    end

    lstOrdensTreino.each do |ordensTreino|
      ordemTreino = ordensTreino.fetch(1)

      #Recupero os itens que o usuario marcou
      if(tipo == :aerobico and params[:ordAerTreino].present?)
        lstTreinos = params[:ordAerTreino][ordemTreino[:atividade_id] ]
      elsif (tipo == :neuro and params[:ordNeuTreino].present?)
        id = ordemTreino[:musculo_attributes][:id]
        lstTreinos = params[:ordNeuTreino][id]
        # Rails.logger.info("Ordens para gravacao:" )
      end

      sOrdem = ""
      if lstTreinos != nil
        lstTreinos.each do |ord|
          sOrdem << ord[1][0] << "|"
        end
      end

      #Adiciono os itens para gravacao
      if (tipo == :aerobico)
        ordemTreino[:ordem_treino] = sOrdem
      elsif (tipo == :neuro)
        ordemTreino[:ordem] = sOrdem
      end

    end

  end

  def callInjectOrdens()
    @ordAerTreino = {}
    @ordNeuTreino = {}

    #Insere a ordem para os treinos Aerobicos
    @atividadesAerobico.each do |atAerobico|
      injectTreinoOrdens(atAerobico, :aerobico)
    end

    #Insere a ordem para os treinos musculares
    @treino.ordemmusculotreinos.each do |atNeuro|
      injectTreinoOrdens(atNeuro, :neuro)
    end

  end

  def injectTreinoOrdens(item, tipo)
    ordens = [[1,"A", false],[2,"B",false],[3,"C",false],[4,"D",false]]

    if (tipo == :aerobico)
      savedOrder =  item.ordem_treino
    elsif (tipo == :neuro)
      savedOrder = item.ordem
    end

    if (savedOrder != nil)
      savedOrder.split("|").each do |ordSel|
        iFound = ordens.index{|x,y| y == ordSel}

        ##Encontrei o item no array
        if iFound != nil and iFound > -1
          ordens[iFound][2] = true
        end

      end
    end

    if (tipo == :aerobico)
      @ordAerTreino.store(item.atividade_id,ordens)
    elsif (tipo == :neuro)
      @ordNeuTreino.store(item.musculo_id,ordens)
    end

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def treino_params
    #params.require(:aluno).permit(:idacademia, :nome, :nascimento, :sexo, :observacao)
    params.require(:treino).permit!
  end

end
