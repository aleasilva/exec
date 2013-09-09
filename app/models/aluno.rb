class Aluno < ActiveRecord::Base
   has_many :treinamentos, dependent: :destroy
   has_many :treinos, through: :treinamentos 
end