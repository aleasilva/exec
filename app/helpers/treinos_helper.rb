module TreinosHelper
  def seekAtividade(atividade)
    eof = @treino.atividades.include?(atividade)
  end
  
  def getMusculo(musculo_id)
    musculo = Musculo.find(4)
  end
  
end
