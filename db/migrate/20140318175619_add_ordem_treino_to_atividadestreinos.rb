class AddOrdemTreinoToAtividadestreinos < ActiveRecord::Migration
  def change
    add_column :atividadetreinos, :ordem_treino, :string, :limit => 20
  end
end
