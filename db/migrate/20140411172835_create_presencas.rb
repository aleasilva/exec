class CreatePresencas < ActiveRecord::Migration
  def change
    create_table :presencas do |t|
      t.date :data
      t.references :aluno, index: true

      t.timestamps
    end
  end
end
