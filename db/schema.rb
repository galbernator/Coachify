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

ActiveRecord::Schema.define(version: 20150731042338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "evaluation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "answer"
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

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "districts", ["company_id"], name: "index_districts_on_company_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "employees", ["location_id"], name: "index_employees_on_location_id", using: :btree

  create_table "evaluations", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "evaluations", ["company_id"], name: "index_evaluations_on_company_id", using: :btree

  create_table "instances", force: :cascade do |t|
    t.integer  "evaluation_id"
    t.integer  "subject_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "instances", ["evaluation_id"], name: "index_instances_on_evaluation_id", using: :btree

  create_table "invitations", force: :cascade do |t|
    t.integer  "sender_id"
    t.string   "recipient_email"
    t.string   "token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "role_id"
    t.integer  "company_id"
  end

  add_index "invitations", ["company_id"], name: "index_invitations_on_company_id", using: :btree
  add_index "invitations", ["role_id"], name: "index_invitations_on_role_id", using: :btree
  add_index "invitations", ["sender_id"], name: "index_invitations_on_sender_id", using: :btree

  create_table "invites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "company_id"
    t.string   "region"
    t.integer  "district_id"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
  end

  add_index "locations", ["company_id"], name: "index_locations_on_company_id", using: :btree
  add_index "locations", ["district_id"], name: "index_locations_on_district_id", using: :btree

  create_table "observations", force: :cascade do |t|
    t.integer  "evaluation_id"
    t.integer  "subject_id"
    t.integer  "observer_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "location_id"
    t.integer  "employee_id"
  end

  add_index "observations", ["employee_id"], name: "index_observations_on_employee_id", using: :btree
  add_index "observations", ["evaluation_id"], name: "index_observations_on_evaluation_id", using: :btree
  add_index "observations", ["location_id"], name: "index_observations_on_location_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "evaluation_id"
    t.string   "text"
    t.string   "kind"
  end

  add_index "questions", ["evaluation_id"], name: "index_questions_on_evaluation_id", using: :btree

  create_table "responses", force: :cascade do |t|
    t.integer  "evaluation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "observation_id"
    t.integer  "question_id"
    t.integer  "answer_id"
  end

  add_index "responses", ["answer_id"], name: "index_responses_on_answer_id", using: :btree
  add_index "responses", ["evaluation_id"], name: "index_responses_on_evaluation_id", using: :btree
  add_index "responses", ["observation_id"], name: "index_responses_on_observation_id", using: :btree
  add_index "responses", ["question_id"], name: "index_responses_on_question_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "company_id"
    t.string   "avatar"
    t.integer  "location_id"
    t.integer  "invitation_id"
    t.integer  "role_id"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["location_id"], name: "index_users_on_location_id", using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "answers", "evaluations"
  add_foreign_key "answers", "questions"
  add_foreign_key "blogposts", "users"
  add_foreign_key "comments", "blogposts"
  add_foreign_key "comments", "users"
  add_foreign_key "districts", "companies"
  add_foreign_key "employees", "locations"
  add_foreign_key "evaluations", "companies"
  add_foreign_key "instances", "evaluations"
  add_foreign_key "invitations", "companies"
  add_foreign_key "invitations", "roles"
  add_foreign_key "locations", "companies"
  add_foreign_key "locations", "districts"
  add_foreign_key "observations", "employees"
  add_foreign_key "observations", "evaluations"
  add_foreign_key "observations", "locations"
  add_foreign_key "questions", "evaluations"
  add_foreign_key "responses", "answers"
  add_foreign_key "responses", "evaluations"
  add_foreign_key "responses", "observations"
  add_foreign_key "responses", "questions"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "locations"
  add_foreign_key "users", "roles"
end
