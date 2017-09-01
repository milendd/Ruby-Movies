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

ActiveRecord::Schema.define(version: 20170831194438) do

  create_table "celebrities", force: :cascade do |t|
    t.string "name"
    t.string "nacionality"
    t.datetime "birthday"
    t.string "gender"
  end

  create_table "celebrities_movies", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "celebrity_id"
    t.integer "celebrity_type_id"
    t.index ["celebrity_id"], name: "index_celebrities_movies_on_celebrity_id"
    t.index ["celebrity_type_id"], name: "index_celebrities_movies_on_celebrity_type_id"
    t.index ["movie_id"], name: "index_celebrities_movies_on_movie_id"
  end

  create_table "celebrity_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.integer "duration"
    t.text "description"
    t.string "genre"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "user_id"
    t.integer "rate"
    t.index ["movie_id"], name: "index_ratings_on_movie_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "encrypted_password"
    t.boolean "is_admin"
  end

end
