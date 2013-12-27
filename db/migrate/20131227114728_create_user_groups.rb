class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :nome
      t.text :descricao
      t.integer :rule_id

      t.timestamps
    end
  end
end