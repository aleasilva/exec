class CreateFormapagamentos < ActiveRecord::Migration
  def change
    create_table :formapagamentos do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
