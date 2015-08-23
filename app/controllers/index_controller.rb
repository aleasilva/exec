class IndexController < ApplicationController

  ##
  #Dependendo das permissoes do usuario muda pagina inicial.
  ##
  def routeStartPage

    if can? :read, Treino
      redirect_to printIndex_path
    else
      redirect_to vendaplanos_path
    end

  end

end
