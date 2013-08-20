class Exercicio < ActiveRecord::Base
  has_many :membros
  accepts_nested_attributes_for :membros

  #Validações
  #validates_presence_of :nome

end
