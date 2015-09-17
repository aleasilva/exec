class Vendaplano < ActiveRecord::Base
  belongs_to :formapagamento
  belongs_to :tipovenda
  belongs_to :tabelaplano
  belongs_to :aluno

  validates  :tipovenda_id        , :presence => true
  validates  :aluno_id            , :presence => true
  validates  :formapagamento_id   , :presence => true

  usar_como_dinheiro :valor_parcela

  def self.import_from_csv(file)
    CSV.foreach(file.path, {:headers => true, :col_sep => ';', :encoding => 'ISO-8859-1'}) do |row|
        hashVenda = row.to_hash

        #
        #{"data"=>"07/05/15", "codigo"=>"15910", "nome do cliente"=>"juraci rita leite de andrade ",
        #"plano"=>"recorrente solo", "período"=>"recorrente", "valor"=>"60", "n° parcelas"=>"12",
        #"pagamento"=>"cartao", "situação"=>"novo", "consultor"=>"alan"}

      	#`id_venda`	integer,
      	#`nu_parcela`	integer,
      	#`dt_pagto`	date,
        byebug
        
        qtdParcelas  = hashVenda["parcelas"]
        valorParcela = hashVenda["valor"]
        dtVenda      = Date.strptime(hashVenda["data"], '%d/%m/%Y')
        planoId      = 1
        planoNome    = hashVenda["plano"]
        pagId        = getIdPagamento(hashPagamento["pagamento"].upcase)
        tipoVendaId  = getTipoVendaId(hashVenda["situacao"].upcase)

        Vendaplano.new( { aluno_id: verifyAluno(hashVenda) , nome_plano:   hashVenda["plano"] ,
                        vendido_por: hashVenda["consultor"], qtd_parcela:  qtdParcelas,
                        valor_parcela: valorParcela        , dt_venda:     dtVenda,
                        tabelaplano_id: planoId            , nome_plano:   planoNome,
                        formapagamento_id: pagId           , tipovenda_id: tipoVendaId})
    end

  end

  private



  #Caso o aluno nao exista no cadastro inclui
  def self.verifyAluno(hshVenda)
    idAcademia = hshVenda["codigo"]
    nome = hshVenda["nome do cliente"]

    aluno = Aluno.where("idacademia = ? ", idAcademia)
    if aluno.size == 0
      Aluno.new({"idacademia" => idAcademia, "nome" => nome.upcase}).save
      aluno = Aluno.where("idacademia = ? ", idAcademia)
    end

    return aluno[0][:id]

  end

  def self.getTipoVendaId(nomeVenda)
    idVen = 0

    if nomeSit.include? "NOV"
      idVen = 1
    elsif nomeSit.include? "MIG"
      idVen = 2
    else
      idVen = 3
    end

    return idVen
  end

  def self.getIdPagamento(nomePag)
    idPag = 0

    #cartao
    if nomePag.include? "CAR"
      idPag = 1
    elsif nomePag.include? "VIS"
      idPag = 1
    elsif nomePag.include? "CR"
      idPag = 2
    elsif nomePag.include? "CHE"
      idPag = 4
    elsif nomePag.include? "NP"
      idPag = 5
    elsif nomePag.include? "NOTA"
      idPag = 5
    else
        idPag = 1
    end

    return idPag
  end

end
