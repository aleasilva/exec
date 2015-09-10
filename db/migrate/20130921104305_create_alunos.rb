class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string  :idacademia   , :limit => 30, :default => ""
      t.string  :nome         , :limit => 80, :default => "Aluno" , :null => false
      t.string  :medicamento  , :limit => 120, :default => "Não toma."
      t.string  :doenca       , :limit => 120, :default => "Não possui."
      t.string  :alergia      , :limit => 120, :default => "Não tem."
      t.string  :dor          , :limit => 120, :default => "Não sente."
      t.string  :email        , :limit => 100, :default => ""
      t.text    :observacao
      t.date    :nascimento   , :default => Date.today
      t.string  :sexo         , :limit => 1 , :default => "f", :null => false
    end
  end
end
