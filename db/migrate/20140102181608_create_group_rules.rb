class CreateGroupRules < ActiveRecord::Migration
  def change
    create_table :group_rules do |t|
      t.integer :group_id
      t.integer :rule_id

      t.timestamps
    end
  end
end
