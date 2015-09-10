class AddQtdParcelaToVendaPlanos < ActiveRecord::Migration
  def change
    add_column :vendaplanos, :qtd_parcela, :integer
  end
end
