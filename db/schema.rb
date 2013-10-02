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

ActiveRecord::Schema.define(version: 20131002180414) do

  create_table "adaptacaodia", force: true do |t|
    t.integer  "adaptacao_id"
    t.integer  "diasemana_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adaptacaos", force: true do |t|
    t.integer  "semana"
    t.integer  "serie"
    t.integer  "repeticao"
    t.integer  "carga"
    t.integer  "intervalo"
    t.string   "observacao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "treino_id"
  end

  create_table "alunoaulas", force: true do |t|
    t.integer  "aluno_id"
    t.integer  "diasemana_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alunos", force: true do |t|
    t.string  "idAcademia", limit: 30, default: ""
    t.string  "nome",       limit: 60, default: "Aluno", null: false
    t.date    "nascimento"
    t.boolean "sexo",       limit: 1,  default: false,   null: false
    t.text    "observacao"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diasemanas", force: true do |t|
    t.string   "nome"
    t.integer  "alunos_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diasemanas", ["alunos_id"], name: "index_diasemanas_on_alunos_id"

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

  add_index "treinos", ["aluno_id"], name: "index_treinos_on_aluno_id"

end
