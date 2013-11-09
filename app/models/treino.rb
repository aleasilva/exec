class Treino < ActiveRecord::Base

  #Relacionamento com os alunos
  belongs_to :aluno

  #Relacionamento as atividades
  has_many :atividadetreinos, dependent: :destroy
  has_many :atividades, through: :atividadetreinos
   
  #Relacionamento com os musculos
  has_many :ordemmusculotreinos, dependent: :destroy
  has_many :musculos, through: :ordemmusculotreinos
  
  #Relacionamento com a adpatacao
  has_many :adaptacaos, dependent: :destroy
  
  accepts_nested_attributes_for :ordemmusculotreinos 
  accepts_nested_attributes_for :adaptacaos, :allow_destroy => true ,
                                :reject_if => proc { |attributes| attributes['semana'].blank? }
  accepts_nested_attributes_for :atividadetreinos, :allow_destroy => true
  
  
end
