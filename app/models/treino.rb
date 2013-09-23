class Treino < ActiveRecord::Base
  #has_many :treinamentos, dependent: :destroy
  #has_many :alunos, through: :treinamentos

  #Relacionamento com os alunos
  belongs_to :aluno

  #Relacionamento as atividades
  has_many :atividadetreinos, dependent: :destroy
  has_many :atividades, through: :atividadetreinos
   
  #Relacionamento com os musculos
  has_many :ordemmusculotreinos, dependent: :destroy
  has_many :musculos, through: :ordemmusculotreinos
  
  accepts_nested_attributes_for :ordemmusculotreinos
  
end
