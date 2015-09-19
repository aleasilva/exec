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

        qtdParcelas  = hashVenda["parcela"].to_i
        valorParcela = hashVenda["valor"].to_f
        dtVenda      = Date.strptime(hashVenda["data"], '%d/%m/%y')
        planoNome    = hashVenda["plano"]
        pagId        = getIdPagamento(hashVenda["pagamento"].upcase)
        tipoVendaId  = getTipoVendaId(hashVenda["situacao"].upcase)
        idGrupoVenda = self.getIdGrupoVenda()
        iParcela     = 1
        planoId      = 1

        for iParcela in 1..qtdParcelas

          if iParcela == 1
            dtPagto      = dtVenda
          else
            dtPagto      = dtVenda >> iParcela-1
          end

          if dtPagto > Date.today - 7

            Vendaplano.new( { aluno_id: verifyAluno(hashVenda) , nome_plano:   hashVenda["plano"] ,
                            vendido_por: hashVenda["consultor"], qtd_parcela:  qtdParcelas,
                            valor_parcela: valorParcela        , dt_venda:     dtVenda,
                            tabelaplano_id: planoId            , nome_plano:   planoNome,
                            formapagamento_id: pagId           , tipovenda_id: tipoVendaId,
                            dt_pagto:   dtPagto                , nu_parcela:   iParcela,
                            id_venda:   idGrupoVenda }).save

          end

        end
    end

  end

  def self.getIdGrupoVenda

    client = Vendaplano.readonly.last

    if client == nil
      idGrupoVenda = 1
    else
      idGrupoVenda = client.id + 1
    end

    return idGrupoVenda
  end

  private
  #Caso o aluno nao exista no cadastro inclui
  def self.verifyAluno(hshVenda)
    idAcademia = hshVenda["codigo"]
    nome = hshVenda["cliente"]

    aluno = Aluno.where("idacademia = ? ", idAcademia)
    if aluno.size == 0
      Aluno.new({"idacademia" => idAcademia, "nome" => nome.upcase}).save
      aluno = Aluno.where("idacademia = ? ", idAcademia)
    end

    return aluno[0][:id]

  end

  def self.getTipoVendaId(nomeVenda)
    idVen = 0

    if nomeVenda.include? "NOV"
      idVen = 1
    elsif nomeVenda.include? "MIG"
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
