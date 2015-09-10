class CreateTabelaplanos < ActiveRecord::Migration
  def change
    create_table :tabelaplanos do |t|
      t.string :nome
      t.integer :qtd_min_parcela
      t.integer :qtd_max_parcela

      t.timestamps null: false
    end
  end
end
