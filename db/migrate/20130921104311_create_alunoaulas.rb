class CreateAlunoaulas < ActiveRecord::Migration
  def change
    create_table :alunoaulas do |t|
      t.integer :aluno_id
      t.integer :diasemana_id

      t.timestamps
    end
  end
end
