# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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