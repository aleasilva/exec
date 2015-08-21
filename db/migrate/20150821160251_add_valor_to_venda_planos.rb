class AddValorToVendaPlanos < ActiveRecord::Migration
  def change
      add_column :vendaplanos, :valorParcela, :float
  end
end
