class AddIdVendaToVendaplanos < ActiveRecord::Migration
  def change
    add_column :vendaplanos, :idGroupoVenda, :integer
  end
end
