class VendaplanosController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_vendaplano, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource #cancan

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
    # byebug
    if (params[:id] == "import")
        redirect_to users_path
    end

  end

  # GET /vendaplanos/new
  def new
    @vendaplano = Vendaplano.new
    @vendaplano.dt_venda =  Date.today
    @vendaplano.aluno_id = params[:aluno_param]

    #Recuperando os dados dos planos
    plano = Tabelaplano.first
    @vendaplano.valor_parcela = plano.valor
    @vendaplano.qtd_parcela = plano.qtd_max_parcela
  end

  # GET /vendaplanos/1/edit
  def edit
  end

  # POST /vendaplanos
  def create
    @vendaplano = Vendaplano.new(vendaplano_params)
    qtd_parcelas = @vendaplano.qtd_parcela

    idGrupoVenda = Vendaplano.getIdGrupoVenda()

    begin
      @vendaplano.transaction do
        msgErro = ""
        #
        for iParcela in 1..qtd_parcelas

          #Gera os planos para os proximos meses.
          if iParcela == 1
            @vendaplano.dt_pagto = @vendaplano.dt_venda
            @vendaplano.dt_baixa = @vendaplano.dt_venda
            @vendaplano.recebido_por = current_user.name
          else
            @vendaplano = criaParcela(@vendaplano.dt_venda, iParcela -1)
          end

          @vendaplano.tabelaplano_id = params[:tabelaplano][:tabelaplano_id].to_i
          @vendaplano.vendido_por = current_user.name
          @vendaplano.nu_parcela = iParcela
          @vendaplano.id_venda = idGrupoVenda
          @vendaplano.valor_parcela = @vendaplano.valor_parcela
          @vendaplano.nome_plano = @vendaplano.tabelaplano.nome

          if ! @vendaplano.save

            #Tratamento das mensagens de erro na atualizacao!

            @vendaplano.errors.messages.each do |message|
              msgErro += "Campo: " + message[0].to_s + " " +  message[1].to_s + "!<br>"
            end

            if msgErro != ""
              flash[:alert] = msgErro.tr_s('["','').tr_s('"]','')
            end
            break

          end

        end

        if msgErro == ""
          redirect_to @vendaplano, notice: 'Venda criada.'
        else
          render action: 'edit'
        end

      end
    rescue ActiveRecord::RecordInvalid => invalid
      render :new
    end
  end

  #Cria uma nova parcela
  def criaParcela(dataVenda, numeroParcela)

    novaParcela  = Vendaplano.new(vendaplano_params)
    novaParcela.dt_baixa = nil
    novaParcela.recebido_por = nil
    novaParcela.dt_pagto = dataVenda >> numeroParcela

    return novaParcela
  end

  # PATCH/PUT /vendaplanos/1
  def update
    if @vendaplano.update(vendaplano_params)
      redirect_to @vendaplano, notice: 'Parcela de venda atualizada.'
    else
      render :edit
    end
  end

  # DELETE /vendaplanos/1
  def destroy
    @vendaplano.destroy
    redirect_to vendaplanos_url, notice: 'Parcela excluida.'
  end

  def import_csv
    Vendaplano.import_from_csv(params[:file])
    redirect_to root_url, notice: "Vendas importadas."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendaplano
        @vendaplano = Vendaplano.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vendaplano_params
      params.require(:vendaplano).permit(:plano_id, :aluno_id, :formapagamento_id,
        :tipovenda_id, :tabelaplano_id, :dt_venda, :valor_parcela, :qtd_parcela)
    end
end
