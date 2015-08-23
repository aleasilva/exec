class TipovendasController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_action :set_tipovenda, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource #cancan

  # GET /tipovendas
  def index
    @tipovendas = Tipovenda.all
    @tipovendas_grid = initialize_grid(@tipovendas,
                                        per_page: 10,
                                        enable_export_to_csv: true,
                                        csv_file_name:'tipovenda')
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
      redirect_to @tipovenda, notice: 'Tipo da venda foi criado.'
    else
      render :new
    end
  end

  # PATCH/PUT /tipovendas/1
  def update
    if @tipovenda.update(tipovenda_params)
      redirect_to @tipovenda, notice: 'Tipo da venda foi atualizado.'
    else
      render :edit
    end
  end

  # DELETE /tipovendas/1
  def destroy
    @tipovenda.destroy
    redirect_to tipovendas_url, notice: 'Tipo da venda foi excluido.'
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
