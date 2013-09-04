class Exercicio < ActiveRecord::Base
  belongs_to :atividade
  belongs_to :musculo
end
