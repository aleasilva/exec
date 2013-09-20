class Musculo < ActiveRecord::Base

  #Relacionamento com as atividades
  has_many :exercicios, dependent: :destroy
  has_many :atividades, through: :exercicios
  
  #Relacionamento com os treinos.
  has_many :ordemmusculotreinos, dependent: :destroy
  has_many :treinos, through: :ordemmusculotreinos    
end
