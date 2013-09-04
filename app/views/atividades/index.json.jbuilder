json.array!(@atividades) do |atividade|
  json.extract! atividade, :nome, :instrucao, :indicacao, :restricao, :observacao, :tipo, :ativo
  json.url atividade_url(atividade, format: :json)
end
