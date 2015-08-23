class DiasemanasController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_action :set_diasemana, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource #cancan

  # GET /diasemanas
  # GET /diasemanas.json
  def index
    @diasemanas = Diasemana.all
  end

  # GET /diasemanas/1
  # GET /diasemanas/1.json
  def show
  end

  # GET /diasemanas/new
  def new
    @diasemana = Diasemana.new
  end

  # GET /diasemanas/1/edit
  def edit
  end

  # POST /diasemanas
  # POST /diasemanas.json
  def create
    @diasemana = Diasemana.new(diasemana_params)

    respond_to do |format|
      if @diasemana.save
        format.html { redirect_to @diasemana, notice: 'Diasemana was successfully created.' }
        format.json { render action: 'show', status: :created, location: @diasemana }
      else
        format.html { render action: 'new' }
        format.json { render json: @diasemana.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diasemanas/1
  # PATCH/PUT /diasemanas/1.json
  def update
    respond_to do |format|
      if @diasemana.update(diasemana_params)
        format.html { redirect_to @diasemana, notice: 'Diasemana was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @diasemana.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diasemanas/1
  # DELETE /diasemanas/1.json
  def destroy
    @diasemana.destroy
    respond_to do |format|
      format.html { redirect_to diasemanas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diasemana
      @diasemana = Diasemana.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diasemana_params
      params.require(:diasemana).permit(:nome, :alunos_id)
    end
end
