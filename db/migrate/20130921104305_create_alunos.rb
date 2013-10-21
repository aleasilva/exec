class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string  :idAcademia   , :limit => 030, :default => ""
      t.string  :nome         , :limit => 060, :default => "Aluno" , :null => false
      t.string  :medicamento  , :limit => 060, :default => ""
      t.string  :doenca       , :limit => 060, :default => ""
      t.string  :alergia      , :limit => 060, :default => ""
      t.string  :dor          , :limit => 060, :default => ""
      t.string  :email        , :limit => 100, :default => ""
      t.text    :observacao
      t.date    :nascimento
      t.boolean :sexo         , :limit => 1 , :default => "F"     , :null => false

    end
  end
end
