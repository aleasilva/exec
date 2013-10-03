class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string  :idAcademia   , :limit => 30, :default => ""
      t.string  :nome         , :limit => 60, :default => "Aluno" , :null => false
      t.string  :medicamentos , :limit => 60, :default => ""
      t.string  :doenca       , :limit => 60, :default => ""
      t.string  :alergia      , :limit => 60, :default => ""
      t.string  :dores        , :limit => 60, :default => ""
      t.text    :observacao
      t.date    :nascimento
      t.boolean :sexo         , :limit => 1 , :default => "F"     , :null => false

    end
  end
end
