class VendaplanosController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_action :set_vendaplano, only: [:show, :edit, :update, :destroy]

  # GET /vendaplanos
  def index
    @vendaplanos = Vendaplano.all
    @vendaplanos_grid = initialize_grid(@vendaplanos,
                                        name: 'g1_vendas_planos',
                                        per_page: 10,
                                        enable_export_to_csv: true,
                                        csv_field_separator: ';',
                                        csv_file_name:'venda_planos')

    export_grid_if_requested('g1_vendas_planos' => 'vendaplanos_export') do
      # usual render or redirect code executed if the request is not a CSV export request
    end
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
    qtdParcelas = @vendaplano.tabelaplano.qtdMaxParcela

    begin
      @vendaplano.transaction do
        #
        for iParcela in 1..qtdParcelas

          #Gera os planos para os proximos meses.
          if iParcela == 1
            @vendaplano.dtPagto = @vendaplano.dtVenda
            @vendaplano.dtBaixa = @vendaplano.dtVenda
            @vendaplano.recebidoPor = current_user.name
          else
            #@vendaplano = criaParcela(@vendaplano)
            @vendaplano = criaParcela(@vendaplano.dtVenda, iParcela -1)
          end

          @vendaplano.vendidoPor = current_user.name
          @vendaplano.nuParcela = iParcela
          @vendaplano.nuDia = @vendaplano.dtPagto.mday
          @vendaplano.save

        end
        redirect_to @vendaplano, notice: 'Registros de vendas criados.'

      end
    rescue ActiveRecord::RecordInvalid => invalid
      render :new
    end
  end

  #Cria uma nova parcela
  def criaParcela(dataVenda, numeroParcela)

    novaParcela  = Vendaplano.new(vendaplano_params)
    novaParcela.dtBaixa = nil
    novaParcela.recebidoPor = nil
    novaParcela.dtPagto = dataVenda >> numeroParcela

    return novaParcela
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
