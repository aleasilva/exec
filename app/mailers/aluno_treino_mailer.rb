class AlunoTreinoMailer < ActionMailer::Base
   default from: "from@example.com"

    def treino_email(alunoId, params)
      #@aluno = Aluno.find(alunoId)
      print(params)
      @url  = 'http://example.com/login'
      mail(to: @aluno.email, subject: 'Treino de hoje')

      #do |format|
      #  format.html { render 'treinoBody' }
      #end


    end

   def print(params)

      begin
        @aluno = Aluno.find(2)
        #@aluno = Aluno.where("idacademia = ? ", params[:idacademia]).first()

        treinos = Treino.where("aluno_id = ? and ? between criacao and validade", @aluno.id ,Date.today)

        if treinos.exists?
          @treino = treinos.first

          #Localizando qual ordem de treino será executada "Treino A,B,C etc.."
          retTreino = @treino.getTreinoExercicios(@aluno, treinos)
          @treinoOrdem = retTreino[0]
          @treinoOrdemItem = retTreino[1]

          #Localizando a adaptacao
          retAdaptacao = @aluno.setAdaptacaoAtual(@treino)
          @semanaTreino = retAdaptacao[1]
          @adaptcaoAtual = retAdaptacao[0]

          #Verifico a confirmacao da impressao.
          if params.include?("doPrint") and
            if @aluno.data_ultimo_treino != Date.today
              @aluno.atualizaStatusTreino(params)
            end

            @aluno.registraPresenca()
          end

        else
          flash[:alert] = 'Náo foi localizado um treino para você, por favor, procure seu professor.'
          redirect_to root_path
        end

      rescue ActiveRecord::RecordNotFound => e
         flash[:alert] = 'Não foi encontrado um aluno(a) com o código informado, por favor, tente novamente.'
         redirect_to root_path

      #rescue Exception => e

      end
  end
end
