class Exercicio < ActiveRecord::Base
  belongs_to :membro

  #Validações
  validates_presence_of :nome

end
