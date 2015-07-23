class TipovendasController < ApplicationController
  before_action :set_tipovenda, only: [:show, :edit, :update, :destroy]

  # GET /tipovendas
  def index
    @tipovendas = Tipovenda.all
  end

  # GET /tipovendas/1
  def show
  end

  # GET /tipovendas/new
  def new
    @tipovenda = Tipovenda.new
  end

  # GET /tipovendas/1/edit
  def edit
  end

  # POST /tipovendas
  def create
    @tipovenda = Tipovenda.new(tipovenda_params)

    if @tipovenda.save
      redirect_to @tipovenda, notice: 'Tipovenda was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tipovendas/1
  def update
    if @tipovenda.update(tipovenda_params)
      redirect_to @tipovenda, notice: 'Tipovenda was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tipovendas/1
  def destroy
    @tipovenda.destroy
    redirect_to tipovendas_url, notice: 'Tipovenda was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipovenda
      @tipovenda = Tipovenda.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipovenda_params
      params.require(:tipovenda).permit(:nome)
    end
end
