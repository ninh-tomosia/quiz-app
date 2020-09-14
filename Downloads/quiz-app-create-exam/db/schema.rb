# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_09_015933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "option_value"
    t.integer "question_id"
    t.boolean "is_correct"
    t.datetime "delete_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name_category", default: "", null: false
    t.string "image", default: ""
    t.integer "user_id"
    t.datetime "delete_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer "question_id"
    t.integer "answer_id"
    t.integer "user_ticket_id"
    t.boolean "checked", default: false
    t.datetime "delete_at"
    t.integer "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.integer "ticket_id"
    t.datetime "delete_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.string "full_name"
    t.string "company"
    t.string "telephone"
    t.string "email"
    t.string "card_token"
    t.datetime "delete_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subtickets", force: :cascade do |t|
    t.integer "subticket_code"
    t.integer "ticket_id"
    t.integer "user_id"
    t.datetime "delete_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "name_ticket", default: "", null: false
    t.integer "time_quiz", null: false
    t.datetime "date_start"
    t.datetime "date_finish"
    t.string "code_quiz", default: ""
    t.datetime "delete_at"
    t.integer "category_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_tickets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ticket_id"
    t.float "total_score", default: 0.0
    t.datetime "time_complete"
    t.datetime "delete_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "phone", default: ""
    t.string "email", default: "", null: false
    t.string "image", default: ""
    t.string "user_type", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "delete_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
