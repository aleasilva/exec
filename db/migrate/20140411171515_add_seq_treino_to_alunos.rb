class AddSeqTreinoToAlunos < ActiveRecord::Migration
  def change
    add_column :alunos, :data_ultimo_treino, :date
    add_column :alunos, :semana_adaptacao, :integer
  end
end
