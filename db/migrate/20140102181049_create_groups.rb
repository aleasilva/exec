class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
