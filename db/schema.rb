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

ActiveRecord::Schema.define(version: 20150826034605) do

  create_table "adaptacaodia", force: :cascade do |t|
    t.integer  "adaptacao_id"
    t.integer  "diasemana_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adaptacaos", force: :cascade do |t|
    t.integer  "treino_id"
    t.integer  "semana"
    t.integer  "serie"
    t.integer  "repeticao"
    t.integer  "carga"
    t.integer  "intervalo"
    t.string   "observacao", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alunoaulas", force: :cascade do |t|
    t.integer  "aluno_id"
    t.integer  "diasemana_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alunos", force: :cascade do |t|
    t.string  "idacademia",       limit: 30,  default: "'"
    t.string  "nome",             limit: 80,  default: "Aluno",       null: false
    t.string  "medicamento",      limit: 120, default: "Não toma."
    t.string  "doenca",           limit: 120, default: "Não possui."
    t.string  "alergia",          limit: 120, default: "Não tem."
    t.string  "dor",              limit: 120, default: "Não sente."
    t.string  "email",            limit: 100, default: "'"
    t.text    "observacao"
    t.date    "nascimento",                   default: '2014-01-04'
    t.string  "sexo",             limit: 1,   default: "f",           null: false
    t.string  "last_treino",      limit: 1,   default: ""
    t.date    "dataUltimoTreino"
    t.integer "semanaAdaptacao"
  end

  create_table "atividades", force: :cascade do |t|
    t.string   "nome",       limit: 120,                null: false
    t.string   "instrucao",  limit: 255
    t.string   "indicacao",  limit: 255
    t.string   "restricao",  limit: 255
    t.string   "observacao", limit: 255
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

  create_table "atividadetreinos", force: :cascade do |t|
    t.integer  "atividade_id"
    t.integer  "treino_id"
    t.string   "tempo",        limit: 255
    t.integer  "velocidade"
    t.integer  "inclinacao"
    t.integer  "carga"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bpm"
    t.string   "ordem_treino", limit: 20
  end

  create_table "diasemanas", force: :cascade do |t|
    t.string   "nome",          limit: 255
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
    t.string   "nome",       limit: 255
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

  create_table "presencas", force: :cascade do |t|
    t.date     "data"
    t.integer  "aluno_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "presencas", ["aluno_id"], name: "index_presencas_on_aluno_id"

  create_table "rules", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "entidade",   limit: 255
    t.string   "regra",      limit: 255
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
    t.integer  "qtdMinParcela"
    t.integer  "qtdMaxParcela"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "periodo"
    t.decimal  "valor",         precision: 14, scale: 2
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
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "vendaplanos", force: :cascade do |t|
    t.integer  "aluno_id"
    t.integer  "tabelaplano_id"
    t.integer  "formapagamento_id"
    t.integer  "tipovenda_id"
    t.date     "dtVenda"
    t.integer  "nuDia"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "nuParcela"
    t.date     "dtPagto"
    t.date     "dtBaixa"
    t.string   "vendidoPor"
    t.string   "recebidoPor"
    t.integer  "idVenda"
    t.integer  "idGroupoVenda"
    t.decimal  "valorParcela",      precision: 14, scale: 2
    t.integer  "qtdParcela"
  end

end
