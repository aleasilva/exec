class AddIdVendaToVendaplanos < ActiveRecord::Migration
  def change
    add_column :vendaplanos, :idVenda, :integer
  end
end
