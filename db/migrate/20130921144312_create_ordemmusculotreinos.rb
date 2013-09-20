class CreateOrdemmusculotreinos < ActiveRecord::Migration
  def change
    create_table :ordemmusculotreinos do |t|
      t.integer :atividade_id
      t.integer :treino_id
      t.string :ordem , :limit => 2

      t.timestamps
    end
  end
end