json.array!(@diasemanas) do |diasemana|
  json.extract! diasemana, :nome, :alunos_id
  json.url diasemana_url(diasemana, format: :json)
end
