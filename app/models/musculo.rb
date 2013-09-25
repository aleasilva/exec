class Musculo < ActiveRecord::Base

  #Relacionamento com as atividades
  has_many :exercicios, dependent: :destroy
  has_many :atividades, through: :exercicios
  accepts_nested_attributes_for :atividades
  
  #Relacionamento com os treinos.
  has_many :ordemmusculotreinos, dependent: :destroy
  has_many :treinos, through: :ordemmusculotreinos    
end
