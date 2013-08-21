class Membro < ActiveRecord::Base
  belongs_to :exercicio
  belongs_to :membro
end
