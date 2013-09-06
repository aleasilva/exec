class CreateExercicios < ActiveRecord::Migration
  def change
    create_table :exercicios do |t|
      t.integer :musculo_id
      t.integer :atividade_id
      
      t.timestamps
    end
  end
end
