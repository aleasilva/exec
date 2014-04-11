class CreateAdaptacaos < ActiveRecord::Migration
  def change
    create_table :adaptacaos do |t|
      t.integer :treino_id, index: true
      t.integer :semana
      t.integer :serie
      t.integer :repeticao
      t.integer :carga
      t.integer :intervalo
      t.string :observacao

      t.timestamps
    end
  end
end
