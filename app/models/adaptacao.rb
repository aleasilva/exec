class Adaptacao < ActiveRecord::Base
  belongs_to :treino

  #Controle das semanas para uso da adaptacao
  has_many :adaptacaodias, dependent: :destroy
  has_many :diasemanas, through: :adaptacaodias

  validates :semana      , :numericality => true
  validates :serie       , :numericality => true
  validates :repeticao   , :numericality => true
  validates :carga       , :numericality => true
  validates :intervalo   , :numericality => true
  
end
