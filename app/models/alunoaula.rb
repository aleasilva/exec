class Alunoaula < ActiveRecord::Base
  belongs_to :aluno
  belongs_to :diasemana
end
