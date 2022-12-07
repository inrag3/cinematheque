# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_07_090923) do
  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.integer "users_id"
    t.integer "contents_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "content_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "rating"
    t.integer "genres_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "content_types_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.decimal "rate_value"
    t.integer "users_id"
    t.integer "contents_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "username"
    t.integer "watched_id"
    t.integer "favourite_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "contents", column: "contents_id"
  add_foreign_key "comments", "users", column: "users_id"
  add_foreign_key "contents", "content_types", column: "content_types_id"
  add_foreign_key "contents", "genres", column: "genres_id"
  add_foreign_key "rates", "contents", column: "contents_id"
  add_foreign_key "rates", "users", column: "users_id"
  add_foreign_key "users", "contents", column: "watched_id"
  add_foreign_key "users", "contents", column: "favourite_id"
end