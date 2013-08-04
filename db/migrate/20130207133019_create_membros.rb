class CreateMembros < ActiveRecord::Migration
  def change
    create_table :membros do |t|
      t.string :nome, :limit => 60, :null => false
      t.timestamps
    end
  end
end
