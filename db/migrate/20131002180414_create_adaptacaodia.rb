class CreateAdaptacaodia < ActiveRecord::Migration
  def change
    create_table :adaptacaodia do |t|
      t.integer :adaptacao_id
      t.integer :diasemana_id

      t.timestamps
    end
  end
end
