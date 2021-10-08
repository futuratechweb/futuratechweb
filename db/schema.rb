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

ActiveRecord::Schema.define(version: 2021_10_08_073754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "invoices", force: :cascade do |t|
    t.string "from_full_name"
    t.string "from_address"
    t.string "from_email"
    t.string "from_phone"
    t.string "to_full_name"
    t.string "to_address"
    t.string "to_email"
    t.string "to_phone"
    t.string "status"
    t.decimal "discount"
    t.decimal "vat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "transaction_id"
    t.integer "amount"
    t.integer "invoice_number"
    t.string "policy_number"
    t.integer "policy_no"
    t.string "date_of_commencement_of_policy"
    t.string "date_of_commencement_of_risk"
    t.string "plan_and_policy"
    t.string "date_of_maturity"
    t.integer "basic_sum_assured"
    t.integer "accidental_benefit_sum_assured"
    t.integer "premium_for_plan"
    t.integer "total_premium_amount_rs"
    t.integer "date_of_paid"
    t.string "date_of_birth_of_assured"
    t.integer "age_of_the_life_assured"
    t.string "nominee_name"
    t.string "nominee_relation"
    t.integer "proposal_no"
    t.string "date_of_proposal"
    t.string "assured_full_name"
    t.string "name_of_proposer"
    t.string "address_of_proposer"
    t.string "address_of_assured"
    t.string "date_for_paid"
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

end
