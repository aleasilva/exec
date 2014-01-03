class CreateUserRules < ActiveRecord::Migration
  def change
    create_table :user_rules do |t|
      t.integer :user_id
      t.integer :rule_id

      t.timestamps
    end
  end
end
