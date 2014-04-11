class CreateAlunoaulas < ActiveRecord::Migration
  def change
    create_table :alunoaulas do |t|
      t.integer :aluno_id , index: true
      t.integer :diasemana_id , index: true
      t.timestamps
    end
  end
end
