class Treino < ActiveRecord::Base
  has_many :treinamentos, dependent: :destroy
  has_many :alunos, through: :treinamentos
  
  has_many :atividadetreinos
  has_many :atividades, through: :atividadetreinos 
end
