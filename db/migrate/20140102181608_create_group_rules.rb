class CreateGroupRules < ActiveRecord::Migration

    create_table :groups_rules do |t|
      t.belongs_to :group
      t.belongs_to :rule
    end

end


