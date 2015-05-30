class Atividadetreino < ActiveRecord::Base
  belongs_to :atividade
  belongs_to :treino

  #Controle das semanas para uso do treino aerobico
  has_many :atividadetreinodias, dependent: :destroy
  has_many :diasemanas , through: :atividadetreinodias

  #accepts_nested_attributes_for :diasemanas
  #accepts_nested_attributes_for :atividadetreinodias

  ###
  #
  #Retorna o valor para o campo ordem_treino com base
  #nos checkbox que foram selecionados na tela, sempre atualiza estes campos
  #
  ###

  def getOrdem_Treino(paramRequest)
    return "E|F|G|"
  end

end
