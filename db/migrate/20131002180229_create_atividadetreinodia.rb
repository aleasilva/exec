class CreateAtividadetreinodia < ActiveRecord::Migration
  def change
    create_table :atividadetreinodia do |t|
      t.integer :atividadetreino_id
      t.integer :diasemana_id

      t.timestamps
    end
  end
end
