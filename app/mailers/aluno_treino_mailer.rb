class AlunoTreinoMailer < ActionMailer::Base
   default from: "from@example.com"
  
    def treino_email(aluno)
      @aluno = aluno
      @treino = Treino.find(1)
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Welcome Alexandre to My Awesome Site')
  end
  
end
