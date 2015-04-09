require "date"

class TreinosController < ApplicationController
  before_action :set_treino, only: [:show, :edit, :update, :destroy]

  def edit
     @treinoAtividadesAerobico =  Atividadetreino.joins("JOIN atividades on atividadetreinos.atividade_id = atividades.id").
                                                  where("atividades.tipo = ? And atividadetreinos.treino_id = ?", 'A', params[:id]  )
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
    @treinoAtividadesAerobico = @treino.atividadetreinos

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
     # params[:treino][:ordemmusculotreinos_attributes].each do |relacionamento|
     #  r =  relacionamento[1][:musculo_attributes][:atividades_attributes]
     #
    if not params[:treino][:atividade_ids].present?
      params[:treino][:atividade_ids] = []
    end
    #Tratamento  para evitar o erro na atualizacao do treinos.
    #Estva excluindo as atividades do treino Muscular.
    @result =  Atividadetreino.joins('JOIN atividades on atividadetreinos.atividade_id = atividades.id').where('atividades.tipo' => 'A')
    @result.each do |res|
       params[:treino][:atividade_ids].push(res.atividade_id)
    end

    respond_to do |format|
      if @treino.update(treino_params)
        format.html { redirect_to @treino, notice: 'Treino atualizado!' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  #
  #Faz gravaçao dos dados e volta para a tela para impressao
  #
  def confirmaTreino
    alunoId = params[:alunoId]
    sAdapta = params[:semanaAdaptacao]
    lTreino = params[:last_treino]

    case params[:treinoAcao]
      when "print"
        redirect_to printTreino_path({:doPrint => 'true',:alunoId => alunoId, :semanaAdaptacao => sAdapta , :last_treino => lTreino})
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
        @aluno = Aluno.find(params[:idAcademia])
        #@aluno = Aluno.where("idAcademia = ? ", params[:idAcademia]).first()

        treinos = Treino.where("aluno_id = ? and ? between criacao and validade", @aluno.id ,Date.today)

        if treinos.exists?
          @treino = treinos.first

          #Localizando qual ordem de treino será executada "Treino A,B,C etc.."
          retTreino = @treino.getTreinoExercicios(@aluno, treinos)
          @treinoOrdem = retTreino[0]
          @treinoOrdemItem = retTreino[1]

          #Localizando a adaptacao
          retAdaptacao = @aluno.setAdaptacaoAtual(@treino)
          @semanaTreino = retAdaptacao[1]
          @adaptcaoAtual = retAdaptacao[0]

          if @semanaTreino == -1
            flash[:alert] = 'A sua semana de treino está fora de sequencia, por favor, procure o seu professor.'
            redirect_to root_path
          end

          #Verifico a confirmacao da impressao.
          if params.include?("doPrint") and
            if @aluno.dataUltimoTreino != Date.today
              @aluno.atualizaStatusTreino(params)
            end

            @aluno.registraPresenca()
          end

        else
          flash[:alert] = 'Náo foi localizado um treino para você, por favor, procure seu professor.'
          redirect_to root_path
        end

      rescue ActiveRecord::RecordNotFound => e
         flash[:alert] = 'Não foi encontrado um aluno(a) com o código informado, por favor, tente novamente.'
         redirect_to root_path

      #rescue Exception => e

      end

  end

  def procurar(atividade)
    eof = @treino.atividades.include?(atividade)
  end
  helper_method :procurar

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_treino
    @treino = Treino.find(params[:id])
    @aluno = Aluno.find(@treino.aluno_id)
    #Rails.logger.info("SET TREINO")
    #Rails.logger.info( Treino.atividadetreinos.merge(Atividade.aerobico).inspect)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def treino_params
    #params.require(:aluno).permit(:idAcademia, :nome, :nascimento, :sexo, :observacao)
    params.require(:treino).permit!
  end


end
