class CreateAtividadetreinodias < ActiveRecord::Migration
  def change
    create_table :atividadetreinodia do |t|
      t.integer :atividadetreino_id, index: true
      t.integer :diasemana_id, index: true

      t.timestamps
    end
  end
end
