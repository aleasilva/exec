class AddValorToVendaPlanos < ActiveRecord::Migration
  def change
      add_column :vendaplanos, :valorParcela, :decimal, :precision => 14, :scale => 2
  end
end
