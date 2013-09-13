class CreateAtividadetreinos < ActiveRecord::Migration
  def change
    create_table :atividadetreinos do |t|
      t.integer :atividade_id
      t.integer :treino_id

      t.timestamps
    end
  end
end
