class CreateAdaptacaodia < ActiveRecord::Migration
  def change
    create_table :adaptacaodia do |t|
      t.integer :adaptacao_id, index: true
      t.integer :diasemana_id, index: true

      t.timestamps
    end
  end
end
