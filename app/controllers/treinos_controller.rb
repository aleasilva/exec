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
    
    case params[:treinoAcao]
      when "print"
        redirect_to printTreino_path({:doPrint => 'true',:alunoId => params[:alunoId], :semanaAdaptacao => params[:semanaAdaptacao], :last_treino => params[:last_treino]})
      when "mail"
        AlunoTreinoMailer.treino_email().deliver        
      else
        #Registrar presenca
    end
     
  end
  
  #Metodos de controle de impressao do treino.
  def printIndex
    @alunos = Aluno.all
    @alunos_grid = initialize_grid(@alunos)   
  end

 def print
    #    @aluno = Aluno.where("idAcademia = ? ", params[:idAcademia]).first()
      @aluno = Aluno.find(2)
      if @aluno != nil
        treinos = Treino.where("aluno_id = ? and ? between criacao and validade", @aluno.id ,Date.today)
        @treino = treinos.first
        if treinos.exists?
          @meuTreino = findTreinoPrint(@aluno, treinos)
          setAdaptacaoAtual()
          
          #Gravo a o treino após a impressão.
          if params.include?("doPrint") and @aluno.dataUltimoTreino != Date.today
            @aluno.dataUltimoTreino =  Date.today
            @aluno.semanaAdaptacao = params[:semanaAdaptacao] 
            @aluno.last_treino = params[:last_treino]
            if @aluno.save
              
            end
         end
        
        else
          Rails.logger.info("NAO EXISTE TREINO******************************")
        end
      else
        Rails.logger.info("NAO NAO********************************")
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
  
  #Localiza o proximo treino baseado no cadastro do aluno.
  def findTreinoPrint(aluno, treinos)
    
    treinoOrdenado = treinos.first.ordemmusculotreinos.sort_by{|reg| reg.ordem }
    @treinoOrdem = ""
    
    if treinoOrdenado.any? {|reg| (reg.ordem > aluno.last_treino)}
      treino =  treinoOrdenado.find{|reg| (reg.ordem > aluno.last_treino)}
    else
      treino =  treinoOrdenado.first
    end
    
    
    #Recuperando a proxima ordem de treino
    @treinoOrdem = treino.ordem

    #Selecionando pela ordem proxima ordem. 
    treinosSelect= treinoOrdenado.select!{|reg| reg.ordem == @treinoOrdem}
    
    return treinosSelect
    
  end

  #
  #Define qual será a adaptacao para o treino do usuário.
  #  
  def setAdaptacaoAtual()
    semAdaptacaoIni = 0
    @adaptcaoAtual = nil
    nSemanaAtual = getSemanaAdaptacao()

    # 
    @treino.adaptacaos.each do |tap|
      semAdaptacaoFim = semAdaptacaoIni + tap.semana    
      
      if nSemanaAtual.between?(semAdaptacaoIni, semAdaptacaoFim)
        @adaptcaoAtual = tap
        break
      end
      semAdaptacaoIni = semAdaptacaoFim
    end     
    
    if @adaptcaoAtual == nil
       @adaptcaoAtual = @treino.adaptacaos.last
    end
    @semanaTreino = nSemanaAtual
    
  end
  
  def getSemanaAdaptacao()
    nUltSemanaTreino = @aluno.dataUltimoTreino.cweek
    nProSemanaTreino = (@aluno.dataUltimoTreino+7).cweek
    nSemanaAtual = Date.today.cweek
    #nSemanaAtual = Date.new(2014,4,23).cweek
    nSemanaAdaptacao = @aluno.semanaAdaptacao
    
    #Mudou de semana?
    if  nUltSemanaTreino != nSemanaAtual
      
        #A semana esta em sequencia?
        if (nUltSemanaTreino+1) == nSemanaAtual
          nSemanaAdaptacao = nSemanaAdaptacao + 1
        else
          #Reportar semana fora de sequencia.
        end
    end
    
    return nSemanaAdaptacao
  end 
  
end