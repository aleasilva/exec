class AddSeqTreinoToAlunos < ActiveRecord::Migration
  def change
    add_column :alunos, :dataUltimoTreino, :date
    add_column :alunos, :semanaAdaptacao, :integer
  end
end