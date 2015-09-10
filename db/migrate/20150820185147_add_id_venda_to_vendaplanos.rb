class AddIdVendaToVendaplanos < ActiveRecord::Migration
  def change
    add_column :vendaplanos, :id_groupo_venda, :integer
  end
end
