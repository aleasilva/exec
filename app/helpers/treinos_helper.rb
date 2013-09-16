module TreinosHelper
  def seekAtividade(atividade)
    eof = @treino.atividades.include?(atividade)
  end
end
