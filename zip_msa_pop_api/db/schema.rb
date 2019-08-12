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

ActiveRecord::Schema.define(version: 2019_08_11_192508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "msas", force: :cascade do |t|
    t.integer "cbsa"
    t.integer "mdiv"
    t.string "name"
    t.string "lsad"
    t.integer "pop_estimate_2014"
    t.integer "pop_estimate_2015"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "zip_cbsas", force: :cascade do |t|
    t.integer "zip"
    t.integer "cbsa"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cbsa"], name: "index_zip_cbsas_on_cbsa"
    t.index ["zip"], name: "index_zip_cbsas_on_zip"
  end

end
