class Aluno < ActiveRecord::Base
   #Relacionamento aluno dia das aulas.
   has_many :alunoaulas, dependent: :destroy
   has_many :diasemanas, through: :alunoaulas
   
   #Relacionamento treinos
   has_many :treinos, dependent: :destroy
   
   #Validadores
   validates  :nome         , :length => { :maximum => 80  },:presence => true, :uniqueness => false
   validates  :idAcademia   , :length => { :maximum => 30  },:presence => true
   validates  :medicamento  , :length => { :maximum => 120 }
   validates  :doenca       , :length => { :maximum => 120 }
   validates  :alergia      , :length => { :maximum => 120 }
   validates  :dor          , :length => { :maximum => 120 }
   validates  :email        , :length => { :maximum => 100 }    
   
end