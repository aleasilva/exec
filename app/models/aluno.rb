class Aluno < ActiveRecord::Base
   #Relacionamento aluno dia das aulas.
   has_many :alunoaulas, dependent: :destroy
   has_many :diasemanas, through: :alunoaulas
   
   #Relacionamento treinos
   has_many :treinos, dependent: :destroy
end