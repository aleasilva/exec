class CreateAtividades < ActiveRecord::Migration
  def change
    #Ativiades sao os exercicios que sera praticados
    create_table :atividades do |t|
      t.string  :nome , :limit => 120, :null => false
      t.string  :instrucao
      t.string  :indicacao
      t.string  :restricao
      t.string  :observacao
      t.string  :tipo , :limit => 1
      t.boolean :ativo ,:default =>true
      t.timestamps
    end
  end
end