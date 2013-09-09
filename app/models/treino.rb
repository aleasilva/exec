class Treino < ActiveRecord::Base
  has_many :treinamentos, dependent: :destroy
  has_many :alunos, through: :treinamentos 
end
