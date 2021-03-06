class MusculosController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_action :set_musculo, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource #cancan

  # GET /musculos
  # GET /musculos.json
  def index
    @musculos = Musculo.all
    @musculos_grid = initialize_grid(@musculos,per_page: 10)
  end

  # GET /musculos/1
  # GET /musculos/1.json
  def show
  end

  # GET /musculos/new
  def new
    @musculo = Musculo.new
  end

  # GET /musculos/1/edit
  def edit
  end

  # POST /musculos
  # POST /musculos.json
  def create
    Rails.logger.info("*CAMISAS* CAMISAS***********************")
    Rails.logger.info( params[:musculo][:atividade_ids].inspect)
    Rails.logger.info("***************************************")

    @musculo = Musculo.new(musculo_params)

    respond_to do |format|
      if @musculo.save
        format.html { redirect_to @musculo, notice: 'Registro criado.' }
        format.json { render action: 'show', status: :created, location: @musculo }
      else
        format.html { render action: 'new' }
        format.json { render json: @musculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /musculos/1
  # PATCH/PUT /musculos/1.json
  def update
    respond_to do |format|
      if @musculo.update(musculo_params)
        format.html { redirect_to @musculo, notice: 'Registro criado.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @musculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musculos/1
  # DELETE /musculos/1.json
  def destroy
    @musculo.destroy
    respond_to do |format|
      format.html { redirect_to musculos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_musculo
      @musculo = Musculo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def musculo_params
      #params.require(:musculo).permit(:nome, :observacao,:selecionado , atividades_attributes: [:id,:atividades_ids])
      #params.require(:musculo).permit(:nome, :observacao,:selecionado )
      #params.require(:musculo).permit(:name, :description , colors_attributes: [:id,:colors_ids])
      params.require(:musculo).permit!
    end
end
