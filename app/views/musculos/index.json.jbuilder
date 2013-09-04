json.array!(@musculos) do |musculo|
  json.extract! musculo, :nome, :observacao, :selecionado
  json.url musculo_url(musculo, format: :json)
end
