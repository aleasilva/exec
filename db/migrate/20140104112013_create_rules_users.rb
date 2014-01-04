class CreateRulesUsers < ActiveRecord::Migration
  def change
    create_table :rules_users do |t|
      t.belongs_to :rule
      t.belongs_to :user
    end
  end
end