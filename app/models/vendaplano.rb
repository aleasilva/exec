class Vendaplano < ActiveRecord::Base
  belongs_to :formapagamento
  belongs_to :tipovenda
  belongs_to :tabelaplano
  belongs_to :aluno
end