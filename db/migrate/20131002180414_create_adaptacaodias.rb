class CreateAdaptacaodias < ActiveRecord::Migration
  def change
    create_table :adaptacaodias do |t|
      t.integer :adaptacao_id
      t.integer :diasemana_id

      t.timestamps
    end
  end
end
