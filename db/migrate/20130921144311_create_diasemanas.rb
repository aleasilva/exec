class CreateDiasemanas < ActiveRecord::Migration
  def change
    create_table :diasemanas do |t|
      t.string :nome

      t.timestamps
    end
  end
end
