class FormapagamentosController < ApplicationController
  before_action :set_formapagamento, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource #cancan

  # GET /formapagamentos
  def index
    @formapagamentos = Formapagamento.all
    @formapagamentos_grid = initialize_grid(@formapagamentos,
                                        per_page: 10,
                                        enable_export_to_csv: true,
                                        csv_file_name:'formaPagamento')

  end

  # GET /formapagamentos/1
  def show
  end

  # GET /formapagamentos/new
  def new
    @formapagamento = Formapagamento.new
  end

  # GET /formapagamentos/1/edit
  def edit
  end

  # POST /formapagamentos
  def create
    @formapagamento = Formapagamento.new(formapagamento_params)

    if @formapagamento.save
      redirect_to @formapagamento, notice: 'Forma de pagamento foi criada.'
    else
      render :new
    end
  end

  # PATCH/PUT /formapagamentos/1
  def update
    if @formapagamento.update(formapagamento_params)
      redirect_to @formapagamento, notice: 'Forma de pagamento foi atualizada.'
    else
      render :edit
    end
  end

  # DELETE /formapagamentos/1
  def destroy
    @formapagamento.destroy
    redirect_to formapagamentos_url, notice: 'Forma de pagamento foi excluida.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formapagamento
      @formapagamento = Formapagamento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def formapagamento_params
      params.require(:formapagamento).permit(:nome)
    end
end
