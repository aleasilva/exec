class AddBpmToAtividadetreino < ActiveRecord::Migration
  def change
    add_column :atividadetreinos, :bpm, :integer
  end
end
