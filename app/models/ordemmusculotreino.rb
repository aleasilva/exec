class Ordemmusculotreino < ActiveRecord::Base
  belongs_to :musculo
  belongs_to :treino
end
