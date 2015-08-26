class AddQtdParcelaToVendaPlanos < ActiveRecord::Migration
  def change
    add_column :vendaplanos, :qtdParcela, :integer
  end
end
