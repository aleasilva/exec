class Exercicio < ActiveRecord::Base
  belongs_to :membro

  #Validações
  validates_presence_of :nome

  private
  def app_params
    params.require(:list).permit(:ativo, :indicacao, :instrucao, :nome, :restricao,:membro_id)
  end

end
