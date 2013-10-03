class TreinosController < ApplicationController
  before_action :set_treino, only: [:show, :edit, :update, :destroy]
  def edit
  end

  def new
    @treino = Treino.new
    @treino.aluno_id = params[:aluno]
    @treino.adaptacaos.build
        
    Musculo.all.each do |m|
      @treino.ordemmusculotreinos.build(:musculo_id => m.id )
    end

    Atividade.where(tipo: 'A').each do |aa|
      @treino.atividadetreinos.build(:atividade_id => aa.id)      
    end
    
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
    Rails.logger.info("*MUSCULO*ORDEMS**********************")
    Rails.logger.info( params[:treino][:musculo_ids].inspect)
    Rails.logger.info("***************************************") 
    
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
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def treino_params
    #params.require(:aluno).permit(:idAcademia, :nome, :nascimento, :sexo, :observacao)
    params.require(:treino).permit!
  end
end
