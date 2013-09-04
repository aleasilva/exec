class AtividadesController < ApplicationController
  before_action :set_atividade, only: [:show, :edit, :update, :destroy]

  # GET /atividades
  # GET /atividades.json
  def index
    @atividades = Atividade.all
  end

  # GET /atividades/1
  # GET /atividades/1.json
  def show
  end

  # GET /atividades/new
  def new
    @atividade = Atividade.new
  end

  # GET /atividades/1/edit
  def edit
  end

  # POST /atividades
  # POST /atividades.json
  def create
    @atividade = Atividade.new(atividade_params)

    respond_to do |format|
      if @atividade.save
        format.html { redirect_to @atividade, notice: 'Atividade was successfully created.' }
        format.json { render action: 'show', status: :created, location: @atividade }
      else
        format.html { render action: 'new' }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atividades/1
  # PATCH/PUT /atividades/1.json
  def update
    respond_to do |format|
      if @atividade.update(atividade_params)
        format.html { redirect_to @atividade, notice: 'Atividade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atividades/1
  # DELETE /atividades/1.json
  def destroy
    @atividade.destroy
    respond_to do |format|
      format.html { redirect_to atividades_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atividade
      @atividade = Atividade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atividade_params
      params.require(:atividade).permit(:nome, :instrucao, :indicacao, :restricao, :observacao, :tipo, :ativo)
    end
end
