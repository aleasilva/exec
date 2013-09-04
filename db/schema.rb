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

ActiveRecord::Schema.define(version: 20130921104304) do

  create_table "alunos", force: true do |t|
    t.string   "idAcademia", limit: 30, default: ""
    t.string   "nome",       limit: 60, default: "Aluno", null: false
    t.date     "nascimento"
    t.string   "sexo",       limit: 1,  default: "F",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
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

end
