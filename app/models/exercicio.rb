class Exercicio < ActiveRecord::Base
  has_many :treinamentos
  has_many :membros, through: :treinamentos

  #Acessibilidade dos itens
  accepts_nested_attributes_for :membros

end
