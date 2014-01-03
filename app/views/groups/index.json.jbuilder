json.array!(@groups) do |group|
  json.extract! group, :nome, :descricao
  json.url group_url(group, format: :json)
end
