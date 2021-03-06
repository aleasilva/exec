class Treino < ActiveRecord::Base

  #Relacionamento com os alunos
  belongs_to :aluno

  #Relacionamento as atividades
  has_many :atividadetreinos, dependent: :destroy
  has_many :atividades, through: :atividadetreinos

  #Relacionamento com os musculos
  has_many :ordemmusculotreinos, dependent: :destroy
  has_many :musculos, through: :ordemmusculotreinos

  #Relacionamento com a adpatacao
  has_many :adaptacaos, dependent: :destroy

  accepts_nested_attributes_for :ordemmusculotreinos
  accepts_nested_attributes_for :adaptacaos, :allow_destroy => true ,
                                :reject_if => proc { |attributes| attributes['semana'].blank? }
  accepts_nested_attributes_for :atividadetreinos, :allow_destroy => true


  ############################################################
  #                                                          #
  #Retorna quais sao os exercicios que devem ser executados  #
  #para o treino passado, leva em consideracao a ordem de    #
  #dos treinos.                                              #
  #Consulta o cadastro de alunos para saber qual foi o ulti- #
  #mo treino executado.                                      #
  #                                                          #
  ############################################################
  def getTreinoExercicios(aluno, treino)

    #Adiciona os itens unicos ao array para ordenacao
    treinoOrdenado = []
    treino.first.ordemmusculotreinos.each do |reg|
      treinoOrdenado << reg.ordem.split("|")
    end
    treinoOrdenado.flatten!.uniq!.sort!

    #treinoOrdenado = treino.first.ordemmusculotreinos.sort_by{|reg| reg.ordem }
    ultimoTreino = ""
    if (aluno.last_treino != nil)
      ultimoTreino = aluno.last_treino
    end

    #if treinoOrdenado.any? {|reg| (reg.ordem > ultimoTreino)}
    #Usar o ary.bsearch {|x| x >=   4 }
    treino = treinoOrdenado.bsearch{ |itemOrdem| itemOrdem > ultimoTreino }
    if treino == nil
      treino =  treinoOrdenado.first
    end

    #Selecionando pela ordem proxima ordem.
    #ordemSelect = treinoOrdenado.select!{|reg| reg.ordem == treino}
    
    return treino

  end

end
