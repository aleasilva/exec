class Atividadetreino < ActiveRecord::Base
  belongs_to :atividade
  belongs_to :treino

  #Controle das semanas para uso do treino aerobico
  has_many :diasemanas, dependent: :destroy
  has_many :atividadetreinodias, through: :diasemanas 
  
  #accepts_nested_attributes_for :atividadetreinodias, :allow_destroy => true  

end
