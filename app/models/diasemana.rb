class Diasemana < ActiveRecord::Base
   #Relacionamento com as aulas.
   has_many :alunoaulas, dependent: :destroy
   has_many :alunos, through: :alunoaulas
end
