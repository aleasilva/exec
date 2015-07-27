class VendaplanosController < ApplicationController
  before_action :set_vendaplano, only: [:show, :edit, :update, :destroy]

  # GET /vendaplanos
  def index
    @vendaplanos = Vendaplano.all
    @vendaplanos_grid = initialize_grid(@vendaplanos,
                                        per_page: 10,
                                        enable_export_to_csv: true,
                                        csv_file_name:'projects')
    export_grid_if_requested
  end

  # GET /vendaplanos/1
  def show
  end

  # GET /vendaplanos/new
  def new
    @vendaplano = Vendaplano.new
    @vendaplano.dtVenda =  Date.today
  end

  # GET /vendaplanos/1/edit
  def edit
  end

  # POST /vendaplanos
  def create
    @vendaplano = Vendaplano.new(vendaplano_params)

    if @vendaplano.save
      redirect_to @vendaplano, notice: 'Vendaplano was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /vendaplanos/1
  def update
    if @vendaplano.update(vendaplano_params)
      redirect_to @vendaplano, notice: 'Vendaplano was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vendaplanos/1
  def destroy
    @vendaplano.destroy
    redirect_to vendaplanos_url, notice: 'Vendaplano was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendaplano
      @vendaplano = Vendaplano.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vendaplano_params
      params.require(:vendaplano).permit(:plano_id, :aluno_id, :formapagamento_id, :tipovenda_id, :tabelaplano_id, :dtVenda, :nuDia, :qtVenda)
    end
end
