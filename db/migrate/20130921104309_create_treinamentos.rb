class CreateTreinamentos < ActiveRecord::Migration
  def change
    create_table :treinamentos do |t|
      t.integer :aluno_id
      t.integer :treino_id

      t.timestamps
    end
  end
end
