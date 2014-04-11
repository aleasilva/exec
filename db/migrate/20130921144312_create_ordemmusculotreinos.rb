class CreateOrdemmusculotreinos < ActiveRecord::Migration
  def change
    create_table :ordemmusculotreinos do |t|
      t.integer :musculo_id, index: true
      t.integer :treino_id, index: true
      t.string :ordem , :limit => 2

      t.timestamps
    end
  end
end