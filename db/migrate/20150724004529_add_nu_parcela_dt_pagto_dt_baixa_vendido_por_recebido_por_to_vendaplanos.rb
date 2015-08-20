class AddNuParcelaDtPagtoDtBaixaVendidoPorRecebidoPorToVendaplanos < ActiveRecord::Migration
  def change
    remove_column :vendaplanos, :qtVenda, :integer

    add_column :vendaplanos, :nuParcela, :integer
    add_column :vendaplanos, :dtPagto, :date
    add_column :vendaplanos, :dtBaixa, :date
    add_column :vendaplanos, :vendidoPor, :string
    add_column :vendaplanos, :recebidoPor, :string
    add_column :vendaplanos, :idVenda, :integer
  end
end
