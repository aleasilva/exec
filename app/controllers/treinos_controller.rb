class TreinosController < ApplicationController
  before_action :set_treino, only: [:show, :edit]
  
    def create
      Rails.logger.info("*TREINOS-TREINOS-TREINOS-TREINOS-TREINOS-TREINOS")
      #Rails.logger.info( params[:aluno][:treino_ids].inspect)
      Rails.logger.info("***************************************")   
    end

    def edit
      
    end
    
    def show
      
    end
  
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_treino
      @treino = Treino.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def treino_params
      #params.require(:aluno).permit(:idAcademia, :nome, :nascimento, :sexo, :observacao)
      params.require(:treino).permit!
    end
end
