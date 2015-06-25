module TreinosHelper


  #Indica se um treino pertence a uma atividade
  def seekAtividade(atividade)
    eof = @treino.atividades.include?(atividade)
  end

  #Controla a quebra da linha da tabela de selecao de Exercicios
  def ctlQuebraLinha()
    @linha=@linha +1
    if @linha % 4 == 0
      content_tag(:div)
      content_tag(:div, "Exercicios_2", class: ["row"])
    end
  end

  def setLinha
    @linha = 0
  end


end
