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

ActiveRecord::Schema.define(version: 20180217044948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctorlists", force: :cascade do |t|
    t.integer  "hospital_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["hospital_id", "created_at"], name: "index_doctorlists_on_hospital_id_and_created_at", using: :btree
    t.index ["hospital_id"], name: "index_doctorlists_on_hospital_id", using: :btree
    t.index ["user_id", "created_at"], name: "index_doctorlists_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_doctorlists_on_user_id", using: :btree
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "encrypted_name"
    t.string   "encrypted_name_iv"
    t.string   "encrypted_street_address"
    t.string   "encrypted_street_address_iv"
    t.string   "encrypted_city"
    t.string   "encrypted_city_iv"
    t.string   "encrypted_state"
    t.string   "encrypted_state_iv"
    t.string   "encrypted_zipcode"
    t.string   "encrypted_zipcode_iv"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "medications", force: :cascade do |t|
    t.string   "encrypted_name"
    t.string   "encrypted_name_iv"
    t.string   "encrypted_dosage"
    t.string   "encrypted_dosage_iv"
    t.string   "encrypted_refills"
    t.string   "encrypted_refills_iv"
    t.integer  "patient_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["patient_id", "created_at"], name: "index_medications_on_patient_id_and_created_at", using: :btree
    t.index ["patient_id"], name: "index_medications_on_patient_id", using: :btree
  end

  create_table "patient_notes", force: :cascade do |t|
    t.text     "encrypted_note"
    t.text     "encrypted_note_iv"
    t.integer  "user_id"
    t.integer  "patient_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["patient_id", "created_at"], name: "index_patient_notes_on_patient_id_and_created_at", using: :btree
    t.index ["patient_id"], name: "index_patient_notes_on_patient_id", using: :btree
    t.index ["user_id", "created_at"], name: "index_patient_notes_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_patient_notes_on_user_id", using: :btree
  end

  create_table "patients", force: :cascade do |t|
    t.string   "encrypted_name"
    t.string   "encrypted_name_iv"
    t.string   "encrypted_date_of_birth"
    t.string   "encrypted_date_of_birth_iv"
    t.string   "encrypted_phone_number"
    t.string   "encrypted_phone_number_iv"
    t.integer  "primary_care_physician"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id", "created_at"], name: "index_patients_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_patients_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "encrypted_name"
    t.string   "encrypted_name_iv"
    t.string   "email"
    t.boolean  "admin"
    t.string   "password_digest"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "auth_token"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  end

  add_foreign_key "doctorlists", "hospitals"
  add_foreign_key "doctorlists", "users"
  add_foreign_key "medications", "patients"
  add_foreign_key "patient_notes", "patients"
  add_foreign_key "patient_notes", "users"
  add_foreign_key "patients", "users"
end
