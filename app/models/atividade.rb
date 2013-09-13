class Atividade < ActiveRecord::Base
  has_many :exercicios, dependent: :destroy
  has_many :musculos, through: :exercicios  
  
  has_many :atividadetreinos
  has_many :treinos, through: :atividadetreinos

end