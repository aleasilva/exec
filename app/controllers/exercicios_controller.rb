class ExerciciosController < ApplicationController
 #before_filter :autenticacao, :except => [:index, :show]  Regra de validacao para todos os metodos exceto index e show
  #before_filter :authenticate_user! #Novo metodo de autenticacao
 #before_filter :autenticacao # linha adicionada
   
  # GET /exercicios
  # GET /exercicios.json
  def index
    @exercicios = Exercicio.order("nome DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exercicios }
    end
  end

  # GET /exercicios/1
  # GET /exercicios/1.json
  def show
    @exercicio = Exercicio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exercicio }
    end
  end

  # GET /exercicios/new
  # GET /exercicios/new.json
  def new
    @exercicio = Exercicio.new
    @membro = Membro.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exercicio }
    end
  end

  # GET /exercicios/1/edit
  def edit
    @exercicio = Exercicio.find(params[:id])
    @membro = Membro.all
  end

  # POST /exercicios
  # POST /exercicios.json
  def create
    @exercicio = Exercicio.new(param_exercicio)
    @membro = Membro.all
    
    respond_to do |format|
      if @exercicio.save
        format.html { redirect_to @exercicio, notice: 'Exercicio was successfully created.' }
        format.json { render json: @exercicio, status: :created, location: @exercicio }
      else
        format.html { render action: "new" }
        format.json { render json: @exercicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exercicios/1
  # PUT /exercicios/1.json
  def update
    @exercicio = Exercicio.find(params[:id])

    respond_to do |format|
      if @exercicio.update_attributes(params[:exercicio])
        format.html { redirect_to @exercicio, notice: 'Exercicio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exercicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercicios/1
  # DELETE /exercicios/1.json
  def destroy
    @exercicio = Exercicio.find(params[:id])
    @exercicio.destroy

    respond_to do |format|
      format.html { redirect_to exercicios_url }
      format.json { head :no_content }
    end
  end

  ##Declaracao de variaveis  
  private
  def param_exercicio
    params.require(:exercicio).permit(:ativo, :indicacao, :instrucao, :nome, :restricao,membros_attributes: [ :membro_id  ])
  end
  
end
