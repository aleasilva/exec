class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string :idAcademia, :limit => 30, :default => ""
      t.string :nome, :limit => 60, :default => "Aluno", :null => false
      t.date :nascimento
      t.string :sexo, :limit => 1, :default => "F", :null => false
      t.timestamps
    end
  end
end
