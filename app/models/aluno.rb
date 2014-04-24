require "date"

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
   
   
  #Atualiza o status do treino do aluno
  def atualizaStatusTreino(params)
    self.dataUltimoTreino =  Date.today
    self.semanaAdaptacao = params[:semanaAdaptacao] 
    self.last_treino = params[:last_treino]
    self.registraPresenca()    
    
    if self.save
      return true        
    else
      return false
    end
    
  end
  
  def registraPresenca()
    self.presencas.create(data: Date.today)
  end


  def getSemanaAdaptacao()
    nUltSemanaTreino = self.dataUltimoTreino.cweek
    nProSemanaTreino = (self.dataUltimoTreino+7).cweek
    nSemanaAtual = Date.today.cweek
    #nSemanaAtual = Date.new(2014,4,23).cweek
    nSemanaAdaptacao = self.semanaAdaptacao
    
    #Mudou de semana?
    if  nUltSemanaTreino != nSemanaAtual
      
        #A semana esta em sequencia?
        if (nUltSemanaTreino+1) == nSemanaAtual
          nSemanaAdaptacao = nSemanaAdaptacao + 1
        else
          #Reportar semana fora de sequencia.
        end
    end
    
    return nSemanaAdaptacao
  end 
  
end