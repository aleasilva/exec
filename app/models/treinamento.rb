class Treinamento < ActiveRecord::Base
  belongs_to :aluno
  belongs_to :treino
  
end