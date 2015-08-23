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

#Teste para identificar os registros que ja existem.
#Diasemana.delete_all
diaSemanaList.each do |nome, nomered, numDia|

  if Diasemana.where("simbnumberal = ?", numDia).size == 0
    Diasemana.create( nome: nome, nomeabreviado: nomered, simbnumberal: numDia)
  end

end

#Populando os grupos
gruposAcessoList = [
  ["SYSTEM_ADMIN", "Administrador do sistema"],
  ["SUPER_USER","Um super usuario nao deve acessar as configuracoes do sistema"],
  ["VENDA_PLANO","Acessa a area de venda de planos"],
  ["TREINOS","Acessa a area de treinos"]
]

#Group.delete_all
gruposAcessoList.each do |nome, descricao|
  if Group.where("nome = ?", nome).size == 0
    Group.create( nome: nome, descricao: descricao)
  end
end

#Populando as regras
regrasList = [

  ["READ","ALL","READ","Ler os dados de todas as tabelas"],
  ["WRITE","ALL","WRITE","Gravar os dados de todas as tabelas"],
  ["DELETE","ALL","DELETE","Excluir os dados de todas as tabelas"]

]

#Rule.delete_all
regrasList.each do |nome, entidade, regra, descricao|
  if Rule.where("nome = ? and regra = ?", nome , regra ).size == 0
    Rule.create( nome: nome, entidade: entidade, regra: regra, descricao: descricao)
  end
  #Rule.create (nome: nome, entidade: entidade, regra: regra, descricao:descricao)
end
