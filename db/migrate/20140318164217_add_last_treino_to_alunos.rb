class AddLastTreinoToAlunos < ActiveRecord::Migration
  def change
    add_column :alunos, :last_treino, :string , :limit => 1, :default => ""
  end
end
