class Atividade < ActiveRecord::Base
  has_many :exercicios, dependent: :destroy
  has_many :musculos, through: :exercicios  
end