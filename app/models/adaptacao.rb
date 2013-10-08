class Adaptacao < ActiveRecord::Base
  belongs_to :treino

  #Controle das semanas para uso da adaptacao
  has_many :adaptacaodias, dependent: :destroy
  has_many :diasemanas, through: :adaptacaodias


end
