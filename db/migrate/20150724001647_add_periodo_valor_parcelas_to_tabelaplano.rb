class AddPeriodoValorParcelasToTabelaplano < ActiveRecord::Migration
  def change
    add_column :tabelaplanos, :periodo, :string
    add_column :tabelaplanos, :valor, :double
    add_column :tabelaplanos, :parcelas, :integer
  end
end
