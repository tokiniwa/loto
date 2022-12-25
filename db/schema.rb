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

ActiveRecord::Schema[7.0].define(version: 2022_12_24_101738) do
  create_table "loto_sixes", charset: "utf8mb4", force: :cascade do |t|
    t.integer "lottery_id", null: false
    t.date "lottery_date", null: false
    t.integer "lottery_number", null: false
    t.integer "priority", null: false
    t.boolean "is_bonus", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lottery_id", "lottery_number"], name: "uidx_loto_sixes_01", unique: true
    t.index ["lottery_id", "priority"], name: "uidx_loto_sixes_02", unique: true
  end

end
