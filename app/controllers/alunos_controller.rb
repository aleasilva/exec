class AlunosController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]

  # GET /alunos
  # GET /alunos.json
  def index
    @alunos = Aluno.all
    @alunos_grid = initialize_grid(@alunos)
  end

  # GET /alunos/1
  # GET /alunos/1.json
  def show
     @treinos_grid = initialize_grid(@aluno.treinos)
  end

  # GET /alunos/new
  def new
    @aluno = Aluno.new
  end

  # GET /alunos/1/edit
  def edit
  end

  # POST /alunos
  # POST /alunos.json
  def create
    Rails.logger.info("*TREINOS***********************")
    Rails.logger.info( params[:aluno][:treino_1].inspect)
    Rails.logger.info("***************************************")   
    
    @aluno = Aluno.new(aluno_params)

    respond_to do |format|
      if @aluno.save
        format.html { redirect_to @aluno, notice: 'Aluno was successfully created.' }
        format.json { render action: 'show', status: :created, location: @aluno }
      else
        format.html { render action: 'new' }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /alunos/1
  # PATCH/PUT /alunos/1.json
  def update
    respond_to do |format|
      if @aluno.update(aluno_params)
        format.html { redirect_to @aluno, notice: 'O aluno foi atualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }

        #Tratamento das mensagens de erro na atualizacao!        
        msgErro = ""
        @aluno.errors.messages.each do |message|
          msgErro += "Campo: " + message[0].to_s + " " +  message[1].to_s + "!<br>" 
        end
        
        if msgErro != ""
          flash[:alert] = msgErro.tr_s('["','').tr_s('"]','')
        end
      end
    end
  end

  # DELETE /alunos/1
  # DELETE /alunos/1.json
  def destroy
    @aluno.destroy
    respond_to do |format|
      format.html { redirect_to alunos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno
      @aluno = Aluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aluno_params
      #params.require(:aluno).permit(:idAcademia, :nome, :nascimento, :sexo, :observacao)
      params.require(:aluno).permit!
    end
end
