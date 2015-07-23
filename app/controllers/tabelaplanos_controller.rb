class TabelaplanosController < ApplicationController
  before_action :set_tabelaplano, only: [:show, :edit, :update, :destroy]

  # GET /tabelaplanos
  def index
    @tabelaplanos = Tabelaplano.all
  end

  # GET /tabelaplanos/1
  def show
  end

  # GET /tabelaplanos/new
  def new
    @tabelaplano = Tabelaplano.new
  end

  # GET /tabelaplanos/1/edit
  def edit
  end

  # POST /tabelaplanos
  def create
    @tabelaplano = Tabelaplano.new(tabelaplano_params)

    if @tabelaplano.save
      redirect_to @tabelaplano, notice: 'Tabelaplano was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tabelaplanos/1
  def update
    if @tabelaplano.update(tabelaplano_params)
      redirect_to @tabelaplano, notice: 'Tabelaplano was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tabelaplanos/1
  def destroy
    @tabelaplano.destroy
    redirect_to tabelaplanos_url, notice: 'Tabelaplano was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tabelaplano
      @tabelaplano = Tabelaplano.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tabelaplano_params
      params.require(:tabelaplano).permit(:nome, :qtdMinParcela, :qtdMaxParcela)
    end
end
