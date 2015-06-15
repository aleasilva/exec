module TreinosHelper

  #Indica se um treino pertence a uma atividade
  def seekAtividade(atividade)
    eof = @treino.atividades.include?(atividade)
  end

  #Cria uma barra para identficacao dos Exercicios
  def insCabExercicio()
    content_tag(:div,content_tag(:a, "Exercicios", class: ["list-group-item list-group-item-success"]), class: ["lst-group"])
    #content_tag(:div, "Exercicios", class: ["borderGreen"])
  end


  #Controla a quebra da linha da tabela de selecao de Exercicios
  def ctlQuebraLinha(linha)
    linha=linha +1
    if linha % 4 == 0
      content_tag(:div)
      content_tag(:div, "Exercicios", class: ["row"])
    end
  end

end
