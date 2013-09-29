class CreateDiasemanas < ActiveRecord::Migration
  def change
    create_table :diasemanas do |t|
      t.string :nome
      t.string :nomeabreviado, :limit => 3
      t.integer :simbnumberal

      t.timestamps
    end
  end
end
