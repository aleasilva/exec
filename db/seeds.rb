# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Populando os dias da semana
diaSemanaList = [
  [ "Domingo", "dom",1 ],
  [ "Segunda", "seg",2 ],
  [ "Terça"  , "ter",3 ],
  [ "Quarta" , "qua",4 ],
  [ "Quinta" , "qui",5 ],
  [ "Sexta"  , "sex",6 ],
  [ "Sábado" , "sáb",7 ]
]
Diasemana.delete_all
diaSemanaList.each do |nome, nomered, numDia|
  Diasemana.create( nome: nome, nomeabreviado: nomered, simbnumberal: numDia)
end

#Populando os grupos
gruposAcessoList = [
  ["SYSTEM_ADMIN", "Administrador do sistema"],
  ["SUPER_USER","Um super usuario nao deve acessar as configuracoes do sistema"],
  ["VENDA_PLANO","Acessa a area de venda de planos"],
  ["TREINOS","Acessa a area de treinos"]
]

Group.delete_all
gruposAcessoList.each do |nome, descricao|
  Group.create( nome: nome, descricao: descricao)
end

#Populando as regras
regrasList = [

  ["READ","ALL","READ","Ler os dados de todas as tabelas"],
  ["WRITE","ALL","WRITE","Gravar os dados de todas as tabelas"],
  ["DELETE","ALL","DELETE","Excluir os dados de todas as tabelas"]

]

Rule.delete_all
regrasList.each do |nome, entidade, regra, descricao|
  Rule.create( nome: nome, entidade: entidade, regra: regra, descricao: descricao)
  #Rule.create (nome: nome, entidade: entidade, regra: regra, descricao:descricao)
end
