require "date"

class Aluno < ActiveRecord::Base
   #Relacionamento aluno dia das aulas.
   has_many :alunoaulas, dependent: :destroy
   has_many :diasemanas, through: :alunoaulas

   #Relacionamento treinos
   has_many :treinos, dependent: :destroy
   has_many :presencas, dependent: :destroy

   #Relacionamento com as vendas
   has_many :vendaplanos

   #Validadores
   validates  :nome         , :length => { :maximum => 80  },:presence => true, :uniqueness => false
   validates  :idacademia   , :length => { :maximum => 30  },:presence => true
   #validates_presence_of :idacademia, :message => "Put some address please"
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
    dataUltimoTreino = Date.today
    if (self.dataUltimoTreino != nil)
      dataUltimoTreino = self.dataUltimoTreino
    end

    nUltSemanaTreino = dataUltimoTreino.cweek
    nProSemanaTreino = (dataUltimoTreino+7).cweek
    nSemanaAtual = Date.today.cweek
    #nSemanaAtual = Date.new(2014,4,23).cweek
    nSemanaAdaptacao = self.semanaAdaptacao

    #Mudou de semana?
    if  nUltSemanaTreino != nSemanaAtual

        #A semana esta em sequencia?
        if (nUltSemanaTreino+1) == nSemanaAtual
          nSemanaAdaptacao = nSemanaAdaptacao + 1
        else
          nSemanaAdaptacao = -1
          #Reportar semana fora de sequencia.
        end
    else
      nSemanaAdaptacao = 0
    end

    return nSemanaAdaptacao
  end


  #################################################################
  #
  #Define qual será a adaptacao para o treino do usuário.
  #
  #################################################################
  def setAdaptacaoAtual(treino)
    semAdaptacaoIni = 0
    adaptcaoAtual = nil
    nSemanaAtual = self.getSemanaAdaptacao()

    #
    treino.adaptacaos.each do |tap|
      semAdaptacaoFim = semAdaptacaoIni + tap.semana

      if nSemanaAtual.between?(semAdaptacaoIni, semAdaptacaoFim)
        adaptcaoAtual = tap
        break
      end
      semAdaptacaoIni = semAdaptacaoFim
    end

    if adaptcaoAtual == nil
       adaptcaoAtual = treino.adaptacaos.last
    end

    return [adaptcaoAtual,nSemanaAtual]
  end

  #private :getSemanaAdaptacao


end
