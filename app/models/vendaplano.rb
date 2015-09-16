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
        #"forma de pagamento"=>"cartao", "situação"=>"novo", "consultor"=>"alan"}

      	#`tabelaplano_id`	integer,
      	#`formapagamento_id`	integer,
      	#`tipovenda_id`	integer,
      	#`id_venda`	integer,
      	#`nu_parcela`	integer,
      	#`dt_pagto`	date,

        qtdParcelas  = hashVenda["parcelas"]
        valorParcela = hashVenda["valor"]
        dtVenda = Date.strptime(hashVenda["data"], '%d/%m/%Y')

        Vendaplano.new( { aluno_id: verifyAluno(hashVenda) , nome_plano:  hashVenda["plano"] ,
                        vendido_por: hashVenda["consultor"], qtd_parcela: qtdParcelas,
                        valor_parcela: valorParcela        , dt_venda: dtVenda })
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


end
