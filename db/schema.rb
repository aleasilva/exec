# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131003202013) do

  create_table "adaptacaodia", force: true do |t|
    t.integer  "adaptacao_id"
    t.integer  "diasemana_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adaptacaos", force: true do |t|
    t.integer  "treino_id"
    t.integer  "semana"
    t.integer  "serie"
    t.integer  "repeticao"
    t.integer  "carga"
    t.integer  "intervalo"
    t.string   "observacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alunoaulas", force: true do |t|
    t.integer  "aluno_id"
    t.integer  "diasemana_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alunos", force: true do |t|
    t.string "idAcademia",  limit: 24,  default: ""
    t.string "nome",        limit: 48,  default: "Aluno",       null: false
    t.string "medicamento", limit: 48,  default: "Não toma."
    t.string "doenca",      limit: 48,  default: "Não possui."
    t.string "alergia",     limit: 48,  default: "Não tem."
    t.string "dor",         limit: 48,  default: "Não sente."
    t.string "email",       limit: 100, default: ""
    t.text   "observacao"
    t.date   "nascimento",              default: '2013-11-01'
    t.string "sexo",        limit: 1,   default: "f",           null: false
  end

  create_table "atividades", force: true do |t|
    t.string   "nome",       limit: 120,                null: false
    t.string   "instrucao"
    t.string   "indicacao"
    t.string   "restricao"
    t.string   "observacao"
    t.string   "tipo",       limit: 1
    t.boolean  "ativo",                  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "atividadetreinodia", force: true do |t|
    t.integer  "atividadetreino_id"
    t.integer  "diasemana_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "atividadetreinos", force: true do |t|
    t.integer  "atividade_id"
    t.integer  "treino_id"
    t.string   "tempo"
    t.integer  "velocidade"
    t.integer  "inclinacao"
    t.integer  "carga"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bpm"
  end

  create_table "diasemanas", force: true do |t|
    t.string   "nome"
    t.string   "nomeabreviado", limit: 3
    t.integer  "simbnumberal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercicios", force: true do |t|
    t.integer  "musculo_id"
    t.integer  "atividade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "musculos", force: true do |t|
    t.string   "nome",        limit: 120,                null: false
    t.string   "observacao",  limit: 120
    t.boolean  "selecionado",             default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ordemmusculotreinos", force: true do |t|
    t.integer  "musculo_id"
    t.integer  "treino_id"
    t.string   "ordem",      limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "treinos", force: true do |t|
    t.date     "criacao"
    t.date     "validade"
    t.text     "observacao"
    t.integer  "aluno_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
