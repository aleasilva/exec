class AddPeriodoValorParcelasToTabelaplano < ActiveRecord::Migration
  def change
    add_column :tabelaplanos, :periodo, :string
    add_column :tabelaplanos, :valor, :decimal, :precision => 14, :scale => 2
    add_column :tabelaplanos, :parcelas, :integer
  end
end
