class CreateMusculos < ActiveRecord::Migration
  def change
    #Partes do corpo que serao trabalhadas, grupomusculares
    create_table :musculos do |t|
      t.string :nome, :limit => 120, :null => false
      t.string :observacao, :limit => 120
      t.boolean :selecionado ,:default =>true
      t.timestamps
    end
    
  end
end
