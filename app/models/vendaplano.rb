class Vendaplano < ActiveRecord::Base
  belongs_to :formapagamento
  belongs_to :tipovenda
  belongs_to :tabelaplano
  belongs_to :aluno

  validates  :tipovenda_id        , :presence => true
  validates  :aluno_id            , :presence => true
  validates  :formapagamento_id   , :presence => true

  usar_como_dinheiro :valor_parcela

  def self.to_csv(options = {})
    CSV.generate(options)
    csv << column_names
    all.each do |venda|
      csv << product.attribute.valur_at(*column_names)
    end

  end

end
