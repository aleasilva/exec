class Musculo < ActiveRecord::Base
  has_many :exercicios, dependent: :destroy
  has_many :atividades, through: :exercicios  
end
