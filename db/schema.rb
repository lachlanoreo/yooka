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

ActiveRecord::Schema.define(version: 2020_08_25_154545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "xp"
    t.integer "time_to_complete"
    t.bigint "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_activities_on_lesson_id"
  end

  create_table "habits", force: :cascade do |t|
    t.string "name"
    t.integer "xp"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "journey_lessons", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.boolean "complete"
    t.bigint "journey_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["journey_id"], name: "index_journey_lessons_on_journey_id"
    t.index ["lesson_id"], name: "index_journey_lessons_on_lesson_id"
  end

  create_table "journeys", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_journeys_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "author"
    t.string "topic"
    t.integer "time_to_complete"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.integer "year_level"
    t.string "school_name"
    t.string "school_class"
    t.integer "xp"
    t.string "photo"
    t.boolean "teacher"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "time_to_complete"
    t.integer "xp"
    t.bigint "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_videos_on_lesson_id"
  end

  add_foreign_key "activities", "lessons"
  add_foreign_key "journey_lessons", "journeys"
  add_foreign_key "journey_lessons", "lessons"
  add_foreign_key "journeys", "users"
  add_foreign_key "videos", "lessons"
end
