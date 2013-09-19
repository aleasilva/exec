class Aluno < ActiveRecord::Base
   #has_many :treinamentos, dependent: :destroy
   #has_many :treinos, through: :treinamentos
    has_many :treinos, dependent: :destroy
end