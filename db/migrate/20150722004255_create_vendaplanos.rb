class CreateVendaplanos < ActiveRecord::Migration
  def change
    create_table :vendaplanos do |t|
      t.integer :aluno_id
      t.integer :tabelaplano_id
      t.integer :formapagamento_id
      t.integer :tipovenda_id
      t.date :dtVenda
      t.integer :nuDia
      t.integer :qtVenda

      t.timestamps null: false
    end
  end
end
