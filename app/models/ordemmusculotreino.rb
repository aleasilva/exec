class Ordemmusculotreino < ActiveRecord::Base
  belongs_to :musculo
  belongs_to :treino
  
  accepts_nested_attributes_for :musculo
end
