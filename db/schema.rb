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

ActiveRecord::Schema.define(version: 2021_09_08_173851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_competencies", force: :cascade do |t|
    t.bigint "application_id", null: false
    t.bigint "competency_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["application_id"], name: "index_app_competencies_on_application_id"
    t.index ["competency_id"], name: "index_app_competencies_on_competency_id"
  end

  create_table "app_cover_paras", force: :cascade do |t|
    t.bigint "application_id", null: false
    t.bigint "cover_para_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
    t.index ["application_id"], name: "index_app_cover_paras_on_application_id"
    t.index ["cover_para_id"], name: "index_app_cover_paras_on_cover_para_id"
  end

  create_table "app_values", force: :cascade do |t|
    t.bigint "application_id", null: false
    t.bigint "value_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["application_id"], name: "index_app_values_on_application_id"
    t.index ["value_id"], name: "index_app_values_on_value_id"
  end

  create_table "applications", force: :cascade do |t|
    t.string "job_title"
    t.string "company_name"
    t.string "logo_url"
    t.string "primary_color"
    t.string "secondary_color"
    t.string "background_color"
    t.string "headers_font"
    t.string "body_font"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "font_link"
    t.string "logo_height_classes"
    t.string "passkey"
    t.string "string_id"
  end

  create_table "bulletpoints", force: :cascade do |t|
    t.string "text"
    t.string "card_type"
    t.bigint "card_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_type", "card_id"], name: "index_bulletpoints_on_card"
  end

  create_table "competencies", force: :cascade do |t|
    t.string "title"
    t.string "text"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cover_paras", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string "string_id"
    t.string "institution"
    t.string "title"
    t.string "date_range"
    t.string "image_url"
    t.date "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hobbies", force: :cascade do |t|
    t.string "string_id"
    t.string "title"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "string_id"
    t.string "institution"
    t.string "job_title"
    t.string "date_range"
    t.string "image_url"
    t.string "text"
    t.date "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nav_tabs", force: :cascade do |t|
    t.string "title"
    t.string "icon_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "url"
    t.string "string_id"
    t.string "title"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.string "author"
    t.string "text"
    t.bigint "job_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_quotes_on_job_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "values", force: :cascade do |t|
    t.string "title"
    t.string "text"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "app_competencies", "applications"
  add_foreign_key "app_competencies", "competencies"
  add_foreign_key "app_cover_paras", "applications"
  add_foreign_key "app_cover_paras", "cover_paras"
  add_foreign_key "app_values", "\"values\"", column: "value_id"
  add_foreign_key "app_values", "applications"
  add_foreign_key "quotes", "jobs"
end
