class Membro < ActiveRecord::Base
  #Acessibilidade dos campos
  attr_accessible :nome

  #Validações
  validates_presence_of :nome
  
end
