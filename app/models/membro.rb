class Membro < ActiveRecord::Base
  #Acessibilidade dos campos

  #Validações
  validates_presence_of :nome
  
end
