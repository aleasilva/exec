class Diasemana < ActiveRecord::Base
  #Relacionamento com as aulas.
  has_many :alunoaulas, dependent: :destroy
  has_many :alunos, through: :alunoaulas

  #Controle das semanas para uso do treino aerobico
  has_many :atividadetreinodias, dependent: :destroy
  has_many :atividadetreinos, through: :atividadetreinodias

  #Controle das semanas para uso da adaptacao
  has_many :adaptacaodias, dependent: :destroy
  has_many :adaptacaos, through: :adaptacaodias

  #accepts_nested_attributes_for :atividadetreinodias

end
