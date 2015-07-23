class CreateTabelaplanos < ActiveRecord::Migration
  def change
    create_table :tabelaplanos do |t|
      t.string :nome
      t.integer :qtdMinParcela
      t.integer :qtdMaxParcela

      t.timestamps null: false
    end
  end
end
