class CreateExercicios < ActiveRecord::Migration
  def change
    create_table :exercicios do |t|
      t.string :nome, :limit => 60, :null => false
      t.text :instrucao
      t.text :restricao
      t.text :indicacao
      t.boolean :ativo ,:default =>true
      t.references :partescorpo

      t.timestamps
    end
    add_index :exercicios, :partescorpo_id
  end
end
