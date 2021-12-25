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

ActiveRecord::Schema.define(version: 2021_12_25_132916) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "citizenship"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_authors_on_name", unique: true
  end

  create_table "book_collections", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "book1_id"
    t.integer "book2_id"
    t.integer "book3_id"
    t.integer "book4_id"
    t.integer "book5_id"
    t.integer "book6_id"
    t.integer "book7_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "price", default: "76.0"
    t.boolean "sale", default: false
    t.index ["book1_id"], name: "index_book_collections_on_book1_id"
    t.index ["book2_id"], name: "index_book_collections_on_book2_id"
    t.index ["book3_id"], name: "index_book_collections_on_book3_id"
    t.index ["book4_id"], name: "index_book_collections_on_book4_id"
    t.index ["book5_id"], name: "index_book_collections_on_book5_id"
    t.index ["book6_id"], name: "index_book_collections_on_book6_id"
    t.index ["book7_id"], name: "index_book_collections_on_book7_id"
    t.index ["title"], name: "index_book_collections_on_title", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "genre_id", null: false
    t.integer "book_collection_id"
    t.decimal "price", default: "19.7"
    t.boolean "sale", default: false
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["book_collection_id"], name: "index_books_on_book_collection_id"
    t.index ["genre_id"], name: "index_books_on_genre_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_genres_on_title", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.date "birth_date"
    t.string "occupation"
    t.string "citizenship"
    t.text "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "books", "authors"
  add_foreign_key "books", "genres"
end
