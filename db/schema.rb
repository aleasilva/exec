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

ActiveRecord::Schema.define(version: 20150912202819) do

  create_table "adaptacaodia", force: :cascade do |t|
    t.integer  "adaptacao_id"
    t.integer  "diasemana_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adaptacaodia", ["adaptacao_id"], name: "index_adaptacaodia_on_adaptacao_id"
  add_index "adaptacaodia", ["diasemana_id"], name: "index_adaptacaodia_on_diasemana_id"

  create_table "adaptacaos", force: :cascade do |t|
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

  add_index "adaptacaos", ["treino_id"], name: "index_adaptacaos_on_treino_id"

  create_table "alunoaulas", force: :cascade do |t|
    t.integer  "aluno_id"
    t.integer  "diasemana_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alunoaulas", ["aluno_id"], name: "index_alunoaulas_on_aluno_id"
  add_index "alunoaulas", ["diasemana_id"], name: "index_alunoaulas_on_diasemana_id"

  create_table "alunos", force: :cascade do |t|
    t.string  "idacademia",         limit: 30,  default: ""
    t.string  "nome",               limit: 80,  default: "Aluno",       null: false
    t.string  "medicamento",        limit: 120, default: "Não toma."
    t.string  "doenca",             limit: 120, default: "Não possui."
    t.string  "alergia",            limit: 120, default: "Não tem."
    t.string  "dor",                limit: 120, default: "Não sente."
    t.string  "email",              limit: 100, default: ""
    t.text    "observacao"
    t.date    "nascimento",                     default: '2015-09-16'
    t.string  "sexo",               limit: 1,   default: "f",           null: false
    t.string  "last_treino",        limit: 1,   default: ""
    t.date    "data_ultimo_treino"
    t.integer "semana_adaptacao"
  end

  create_table "atividades", force: :cascade do |t|
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

  create_table "atividadetreinodia", force: :cascade do |t|
    t.integer  "atividadetreino_id"
    t.integer  "diasemana_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "atividadetreinodia", ["atividadetreino_id"], name: "index_atividadetreinodia_on_atividadetreino_id"
  add_index "atividadetreinodia", ["diasemana_id"], name: "index_atividadetreinodia_on_diasemana_id"

  create_table "atividadetreinos", force: :cascade do |t|
    t.integer  "atividade_id"
    t.integer  "treino_id"
    t.string   "tempo"
    t.integer  "velocidade"
    t.integer  "inclinacao"
    t.integer  "carga"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bpm"
    t.string   "ordem_treino", limit: 20
  end

  add_index "atividadetreinos", ["atividade_id"], name: "index_atividadetreinos_on_atividade_id"
  add_index "atividadetreinos", ["treino_id"], name: "index_atividadetreinos_on_treino_id"

  create_table "diasemanas", force: :cascade do |t|
    t.string   "nome"
    t.string   "nomeabreviado", limit: 3
    t.integer  "simbnumberal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercicios", force: :cascade do |t|
    t.integer  "musculo_id"
    t.integer  "atividade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formapagamentos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_rules", force: :cascade do |t|
    t.integer "group_id"
    t.integer "rule_id"
  end

  create_table "groups_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "musculos", force: :cascade do |t|
    t.string   "nome",        limit: 120,                null: false
    t.string   "observacao",  limit: 120
    t.boolean  "selecionado",             default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ordemmusculotreinos", force: :cascade do |t|
    t.integer  "musculo_id"
    t.integer  "treino_id"
    t.string   "ordem",      limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ordemmusculotreinos", ["musculo_id"], name: "index_ordemmusculotreinos_on_musculo_id"
  add_index "ordemmusculotreinos", ["treino_id"], name: "index_ordemmusculotreinos_on_treino_id"

  create_table "presencas", force: :cascade do |t|
    t.date     "data"
    t.integer  "aluno_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "presencas", ["aluno_id"], name: "index_presencas_on_aluno_id"

  create_table "rules", force: :cascade do |t|
    t.string   "nome"
    t.string   "entidade"
    t.string   "regra"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rules_users", force: :cascade do |t|
    t.integer "rule_id"
    t.integer "user_id"
  end

  create_table "tabelaplanos", force: :cascade do |t|
    t.string   "nome"
    t.integer  "qtd_min_parcela"
    t.integer  "qtd_max_parcela"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "periodo"
    t.decimal  "valor",           precision: 14, scale: 2
    t.integer  "parcelas"
  end

  create_table "tipovendas", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treinos", force: :cascade do |t|
    t.date     "criacao"
    t.date     "validade"
    t.text     "observacao"
    t.integer  "aluno_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vendaplanos", force: :cascade do |t|
    t.integer  "aluno_id"
    t.integer  "tabelaplano_id"
    t.integer  "formapagamento_id"
    t.integer  "tipovenda_id"
    t.date     "dt_venda"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "nu_parcela"
    t.date     "dt_pagto"
    t.date     "dt_baixa"
    t.string   "vendido_por"
    t.string   "recebido_por"
    t.integer  "id_venda"
    t.decimal  "valor_parcela",     precision: 14, scale: 2
    t.integer  "qtd_parcela"
    t.string   "nome_plano"
  end

end
