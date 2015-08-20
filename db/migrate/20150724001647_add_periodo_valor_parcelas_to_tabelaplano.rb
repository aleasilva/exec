class AddPeriodoValorParcelasToTabelaplano < ActiveRecord::Migration
  def change
    add_column :tabelaplanos, :periodo, :string
    add_column :tabelaplanos, :valor, :float
    add_column :tabelaplanos, :parcelas, :integer
  end
end
