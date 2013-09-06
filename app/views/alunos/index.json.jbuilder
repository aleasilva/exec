json.array!(@alunos) do |aluno|
  json.extract! aluno, :idAcademia, :nome, :nascimento, :sexo, :observacao
  json.url aluno_url(aluno, format: :json)
end
