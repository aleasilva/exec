class CreateAtividadetreinos < ActiveRecord::Migration
  def change
    create_table :atividadetreinos do |t|
      t.integer :atividade_id, index: true
      t.integer :treino_id, index: true
      t.string  :tempo
      t.integer :velocidade
      t.integer :inclinacao
      t.integer :carga

      t.timestamps
    end
  end
end
