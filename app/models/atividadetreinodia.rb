class Atividadetreinodia < ActiveRecord::Base
   has_many :atividadetreinos, dependent: :destroy
   has_many :diasemanas, through: :atividadetreinos
end
