class Tabelaplano < ActiveRecord::Base
  has_many :vendaplanos

  #Tratamento dos campos de valores
  usar_como_dinheiro :valor
end
