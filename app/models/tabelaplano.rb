class Tabelaplano < ActiveRecord::Base
  has_many :vendaplanos , dependent: :restrict_with_exception

  #Tratamento dos campos de valores
  usar_como_dinheiro :valor
end
