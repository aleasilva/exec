class CreateUserRules < ActiveRecord::Migration

    create_table :users_rules do |t|
      t.c :rule
      t.belongs_to :user
    end

end
