class AddNuParcelaDtPagtoDtBaixaVendidoPorRecebidoPorToVendaplanos < ActiveRecord::Migration
  def change
    remove_column :vendaplanos, :qt_venda, :integer

    add_column :vendaplanos, :nu_parcela, :integer
    add_column :vendaplanos, :dt_pagto, :date
    add_column :vendaplanos, :dt_baixa, :date
    add_column :vendaplanos, :vendido_por, :string
    add_column :vendaplanos, :recebido_por, :string
    add_column :vendaplanos, :id_venda, :integer
  end
end
