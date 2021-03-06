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

ActiveRecord::Schema.define(version: 2019_01_30_223008) do

  create_table "lesson_topics", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "course_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "tip_id"
    t.integer "user_id"
    t.integer "stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tip_id"], name: "index_ratings_on_tip_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "tips", force: :cascade do |t|
    t.integer "user_id"
    t.integer "lesson_topic_id"
    t.string "name"
    t.text "description"
    t.string "resource_link"
    t.string "user_outcome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_topic_id"], name: "index_tips_on_lesson_topic_id"
    t.index ["user_id", "created_at"], name: "index_tips_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_tips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.boolean "has_graduated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
