class TreinosController < ApplicationController
  before_action :set_treino, only: [:show, :edit, :update, :destroy] 
  
  def edit
      @treinoAtividadesAerobico =  Atividadetreino.joins('JOIN atividades on atividadetreinos.atividade_id = atividades.id').where('atividades.tipo' => 'A')
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
    
    Rails.logger.info("*MUSCULO*ORDEMS**********************")
    Rails.logger.info( params[:treino][:musculo_ids].inspect)
    Rails.logger.info("***************************************") 
    

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
