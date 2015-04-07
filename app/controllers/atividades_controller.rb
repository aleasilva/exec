class AtividadesController < ApplicationController
  before_action :set_atividade, only: [:show, :edit, :update, :destroy]

  # GET /atividades
  def index
    @atividades_grid = initialize_grid(Atividade)
  end

  # GET /atividades/1
  def show
  end

  # GET /atividades/new
  def new
    @atividade = Atividade.new
  end

  # GET /atividades/1/edit
  def edit
  end

  # POST /atividades
  def create
    @atividade = Atividade.new(atividade_params)

    respond_to do |format|
      if @atividade.save
        format.html { redirect_to @atividade, notice: 'Atividade was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /atividades/1
  def update
    respond_to do |format|
      if @atividade.update(atividade_params)
        format.html { redirect_to @atividade, notice: 'Atividade was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /atividades/1
  # DELETE /atividades/1.json
  def destroy
    @atividade.destroy
    respond_to do |format|
      format.html { redirect_to atividades_url }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_atividade
      @atividade  = Atividade.find(params[:id])
      #@atividade = Atividade.where(" id = ? "  , params[:id])[0]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atividade_params
      params.require(:atividade).permit(:nome, :instrucao, :indicacao, :restricao, :observacao, :tipo, :ativo)
    end

end
