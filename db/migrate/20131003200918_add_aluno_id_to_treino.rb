class AddAlunoIdToTreino < ActiveRecord::Migration
  def change
    add_column :treinos, :aluno_id, :integer
  end
end
