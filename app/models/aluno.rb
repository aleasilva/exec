class Aluno < ActiveRecord::Base
   #Relacionamento aluno dia das aulas.
   has_many :alunoaulas, dependent: :destroy
   has_many :diasemanas, through: :alunoaulas
   
   #Relacionamento treinos
   has_many :treinos, dependent: :destroy
   has_many :presencas, dependent: :destroy
   
   #Validadores
   validates  :nome         , :length => { :maximum => 80  },:presence => true, :uniqueness => false
   validates  :idAcademia   , :length => { :maximum => 30  },:presence => true
   #validates_presence_of :idAcademia, :message => "Put some address please"
   validates  :medicamento  , :length => { :maximum => 120 }
   validates  :doenca       , :length => { :maximum => 120 }
   validates  :alergia      , :length => { :maximum => 120 }
   validates  :dor          , :length => { :maximum => 120 }
   validates  :email        , :length => { :maximum => 100 } 
   #validates  :email        , :length => { :maximum => 100 }, :presence => false,:uniqueness => true 
   #validates_format_of :email, :with => /\A[a-zA-Z]+\z/, :message => "está com formato inválido"    
end