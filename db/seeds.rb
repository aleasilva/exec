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
  ["TREINO","Acessa a area de treinos"]
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

#Criacao dos usuarios padroes
userList = [
  ["VENDA_PLANO","venda","venda@academia.com.br","123456",],
  ["TREINO","treino","treino@academia.com.br","123456",],
  ["SYSTEM_ADMIN","admin","admin@academia.com.br","123456",],
  ["SUPER_USER","super","super@academia.com.br","123456",],
]

userList.each do |grupo,nome,email,senha|
  if User.where("name = ? ", nome ).size == 0
    grupo = Group.where("nome = ?", grupo)
    if grupo != nil
      idGrupo = grupo[0].id.to_s

      usuario = {"name"=>nome, "email"=>email,"password"=>senha,
           "password_confirmation"=>senha, "group_ids"=>[idGrupo], "id"=>""}

      novoUsuario = User.new(usuario)
      novoUsuario.save
    end
  end
end

#Criacao dos planos
tabelaPlanosList =[
  ["Solo livre - Semestral",4, 120],
  ["Solo livre - Anual",7,118.29],
  ["Solo + 1 aula - Semestral",4,178.50],
  ["Solo + 1 aula - Anual",7,169.71],
  ["Solo + 2 aulas - Semestral",4,208.50],
  ["Solo + 2 aulas - Anual",7,204],
  ["Solo + 3 aulas - Semestral",4,223.50],
  ["Solo + 3 aulas - Anual",7,221.14],
  ["Hidro + 1 aula - Semestral",4,105],
  ["Hidro + 1 aula - Anual",7,96],
  ["Hidro + 2 aulas - Semestral",4,135],
  ["Hidro + 2 aulas - Anual",7,109.71],
  ["Hidro + 3 aulas - Semestral",4,150],
  ["Hidro + 3 aulas - Anual",7,135.43],
  ["Água + 1 aula - Semestral",4,120],
  ["Água + 1 aula - Anual",7,118.29],
  ["Água + 2 aulas - Semestral",4,150],
  ["Água + 2 aulas - Anual",7,135.43],
  ["Água + 3 aulas - Semestral",4,180],
  ["Água + 3 aulas - Anual",7,169.71]
]

tabelaPlanosList.each do |nome, qtdParcela, valor|
  if Tabelaplano.where("nome = ?", nome).size == 0
    plano = {"nome" => nome, "qtdMaxParcela" => qtdParcela, "valor" => valor}

    novoPlano = Tabelaplano.new(plano)
    novoPlano.save

  end
end

#Tipos de venda
tipoVendaList = [
                ["Novo",""],
                ["Migração",""],
                ["Renovação",""]
              ]

tipoVendaList.each do |nome, temp|
  if Tipovenda.where("nome = ? " , nome).size == 0
    Tipovenda.new({"nome" => nome}).save
  end
end

#Forma Pagto
frmPagtoList =[
  ["Á vista",""],
  ["Cartão de débito",""],
  ["Cartão de crédito",""]
]

frmPagtoList.each do |nome , x|
  if Formapagamento.where("nome = ? ", nome).size == 0
    Formapagamento.new({"nome" => nome}).save
  end
end
