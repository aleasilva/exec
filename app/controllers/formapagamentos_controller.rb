class FormapagamentosController < ApplicationController
  before_action :set_formapagamento, only: [:show, :edit, :update, :destroy]

  # GET /formapagamentos
  def index
    @formapagamentos = Formapagamento.all
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
      redirect_to @formapagamento, notice: 'Formapagamento was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /formapagamentos/1
  def update
    if @formapagamento.update(formapagamento_params)
      redirect_to @formapagamento, notice: 'Formapagamento was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /formapagamentos/1
  def destroy
    @formapagamento.destroy
    redirect_to formapagamentos_url, notice: 'Formapagamento was successfully destroyed.'
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
