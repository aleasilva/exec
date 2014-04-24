class AlunoTreinoMailer < ActionMailer::Base
   default from: "from@example.com"
  
    def treino_email(alunoId)
      @aluno = Aluno.find(alunoId)
      @url  = 'http://example.com/login'
      mail(to: @aluno.email, subject: 'Welcome Alexandre to My Awesome Site')
    end
    
end
