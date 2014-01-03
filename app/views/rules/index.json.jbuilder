json.array!(@rules) do |rule|
  json.extract! rule, :nome, :entidade, :regra, :descricao
  json.url rule_url(rule, format: :json)
end
