class MembrosController < ApplicationController
  respond_to :html, :json, :xml
    
  # GET /partescorpos
  # GET /partescorpos.json
  def index
    @membros = Membro.all

    respond_with(@membros)
  end

  # GET /partescorpos/1
  # GET /partescorpos/1.json
  def show
    @membro = Membro.find(params[:id])

    respond_with(@membro )
  end

  # GET /partescorpos/new
  # GET /partescorpos/new.json
  def new
    @membro = Membro.new

    respond_with(@membro)
  end

  # GET /partescorpos/1/edit
  def edit
    @membro = Membro.find(params[:id])
  end

  # POST /partescorpos
  # POST /partescorpos.json
  def create
    @membro = Membro.new(membro_params)
    @membro.save

    respond_with(@membro)
  end


  # PUT /partescorpos/1
  # PUT /partescorpos/1.json
  def update
    @membro = Membro.find(params[:id])

    respond_to do |format|
      if @membro.update_attributes(membro_params)
        format.html { redirect_to @membro, notice: 'Partescorpo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @membro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partescorpos/1
  # DELETE /partescorpos/1.json
  def destroy
    @membro = Membro.find(params[:id])
    @membro.destroy

    respond_to do |format|
      format.html { redirect_to membros_url }
      format.json { head :no_content }
    end
  end
  
  #Declaracao dos atributos
  private
  def membro_params
    params.require(:membro).permit(:nome)
  end
  
end
