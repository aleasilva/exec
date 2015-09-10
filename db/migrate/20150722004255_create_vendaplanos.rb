class CreateVendaplanos < ActiveRecord::Migration
  def change
    create_table :vendaplanos do |t|
      t.integer :aluno_id
      t.integer :tabelaplano_id
      t.integer :formapagamento_id
      t.integer :tipovenda_id
      t.date :dt_venda
      t.integer :nu_dia
      t.integer :qt_venda

      t.timestamps null: false
    end
  end
end
