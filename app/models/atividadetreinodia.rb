class Atividadetreinodia < ActiveRecord::Base
   belongs_to :atividade
   belongs_to :diasemana
   
   attr_accessor :isSelected   
  #   has_many :atividadetreinos, dependent: :destroy
  # has_many :diasemanas, through: :atividadetreinos
end
