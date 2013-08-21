class Membro < ActiveRecord::Base
  has_many :treinamentos
  has_many :exercicios, through: :treinamentos
  
end
