class CreateAtividadetreinodias < ActiveRecord::Migration
  def change
    create_table :atividadetreinodias do |t|
      t.integer :atividadetreino_id
      t.integer :diasemana_id

      t.timestamps
    end
  end
end
