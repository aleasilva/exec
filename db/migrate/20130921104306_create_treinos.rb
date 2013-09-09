class CreateTreinos < ActiveRecord::Migration
  def change
    create_table :treinos do |t|
      t.date :criacao
      t.date :validade
      t.text :observacao

      t.timestamps
    end
  end
end
