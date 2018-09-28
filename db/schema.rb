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

ActiveRecord::Schema.define(version: 2018_09_28_135151) do

  create_table "alunos", force: :cascade do |t|
    t.text "nome"
    t.text "cpf"
    t.date "data_nascimento"
    t.integer "telefone"
    t.text "genero"
    t.text "meio_pagamento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faturas", force: :cascade do |t|
    t.decimal "valor"
    t.date "data_vencimento"
    t.text "status", default: "Aberta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "matricula_id"
  end

  create_table "instituicaos", force: :cascade do |t|
    t.text "nome"
    t.text "cnpj"
    t.text "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matriculas", force: :cascade do |t|
    t.decimal "valor_total"
    t.integer "quantidade_faturas"
    t.integer "dia_vencimento_faturas"
    t.text "nome_curso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "aluno_id"
    t.integer "instituicao_id"
  end

end
