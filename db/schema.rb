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

ActiveRecord::Schema.define(version: 20150708011326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "evaluation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "answers", ["evaluation_id"], name: "index_answers_on_evaluation_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "blogposts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "image"
  end

  add_index "blogposts", ["user_id"], name: "index_blogposts_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "blogpost_id"
    t.integer  "user_id"
  end

  add_index "comments", ["blogpost_id"], name: "index_comments_on_blogpost_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
    t.string   "nickname"
  end

  add_index "companies", ["slug"], name: "index_companies_on_slug", using: :btree

  create_table "evaluations", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "evaluations", ["company_id"], name: "index_evaluations_on_company_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "company_id"
    t.string   "region"
  end

  add_index "locations", ["company_id"], name: "index_locations_on_company_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "evaluation_id"
    t.string   "text"
    t.string   "type"
  end

  add_index "questions", ["evaluation_id"], name: "index_questions_on_evaluation_id", using: :btree

  create_table "responses", force: :cascade do |t|
    t.integer  "evaluation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "responses", ["evaluation_id"], name: "index_responses_on_evaluation_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "is_admin"
    t.string   "is_manager"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "is_site_admin"
    t.integer  "company_id"
    t.string   "avatar"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree

  add_foreign_key "answers", "evaluations"
  add_foreign_key "answers", "questions"
  add_foreign_key "blogposts", "users"
  add_foreign_key "comments", "blogposts"
  add_foreign_key "comments", "users"
  add_foreign_key "evaluations", "companies"
  add_foreign_key "locations", "companies"
  add_foreign_key "questions", "evaluations"
  add_foreign_key "responses", "evaluations"
  add_foreign_key "users", "companies"
end
