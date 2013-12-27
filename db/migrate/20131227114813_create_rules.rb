class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string :nome
      t.string :entidade
      t.string :regra
      t.text :descricao

      t.timestamps
    end
  end
end
