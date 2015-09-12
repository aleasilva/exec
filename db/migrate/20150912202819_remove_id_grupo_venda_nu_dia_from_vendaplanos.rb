class RemoveIdGrupoVendaNuDiaFromVendaplanos < ActiveRecord::Migration
  def change
    remove_column :vendaplanos, :nu_dia
    remove_column :vendaplanos, :id_groupo_venda
    add_column :vendaplanos, :nome_plano, :string
  end
end
