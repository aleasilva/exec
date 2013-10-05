class Diasemana < ActiveRecord::Base
   #Relacionamento com as aulas.
   has_many :alunoaulas, dependent: :destroy
   has_many :alunos, through: :alunoaulas
   
     #Controle das semanas para uso do treino aerobico
   has_many :atividadetreinos, dependent: :destroy
   has_many :atividadetreinodias, through: :atividadetreinos
   
end
