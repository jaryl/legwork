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

ActiveRecord::Schema[7.0].define(version: 2022_08_27_111349) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "beneficiaries_gender", ["male", "female"]
  create_enum "needs_status", ["draft", "active", "archived"]

  create_table "account_login_change_keys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "login", null: false
    t.datetime "deadline", null: false
  end

  create_table "account_password_reset_keys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.datetime "deadline", null: false
    t.datetime "email_last_sent", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "account_remember_keys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.datetime "deadline", null: false
  end

  create_table "account_verification_keys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.datetime "requested_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "email_last_sent", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "status", default: 1, null: false
    t.citext "email", null: false
    t.string "password_hash"
    t.index ["email"], name: "index_accounts_on_email", unique: true, where: "(status = ANY (ARRAY[1, 2]))"
  end

  create_table "beneficiaries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "full_name", null: false
    t.enum "gender", enum_type: "beneficiaries_gender"
    t.string "contact_number"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaigns", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "need_id", null: false
    t.uuid "manager_id", null: false
    t.uuid "pool_id", null: false
    t.string "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "funding_goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_campaigns_on_manager_id"
    t.index ["need_id"], name: "index_campaigns_on_need_id"
    t.index ["pool_id"], name: "index_campaigns_on_pool_id"
  end

  create_table "coordinators", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.jsonb "contact_methods", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disbursements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "need_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["need_id"], name: "index_disbursements_on_need_id"
  end

  create_table "donations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "donor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donor_id"], name: "index_donations_on_donor_id"
  end

  create_table "donors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "needs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "beneficiary_id", null: false
    t.uuid "manager_id", null: false
    t.enum "status", enum_type: "needs_status"
    t.string "nature"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beneficiary_id"], name: "index_needs_on_beneficiary_id"
    t.index ["manager_id"], name: "index_needs_on_manager_id"
  end

  create_table "pools", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "handler_type", null: false
    t.uuid "handler_id", null: false
    t.string "name", null: false
    t.string "scheme_class", null: false
    t.jsonb "scheme_payload", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["handler_type", "handler_id"], name: "index_pools_on_handler"
  end

  create_table "profiles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id", null: false
    t.string "profileable_type"
    t.uuid "profileable_id"
    t.string "display_name", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_profiles_on_account_id"
    t.index ["profileable_type", "profileable_id"], name: "index_profiles_on_profileable"
  end

  create_table "transaction_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "pool_id", null: false
    t.string "transactable_type", null: false
    t.uuid "transactable_id", null: false
    t.integer "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pool_id"], name: "index_transaction_records_on_pool_id"
    t.index ["transactable_type", "transactable_id"], name: "index_transaction_records_on_transactable"
  end

  create_table "updates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "campaign_id", null: false
    t.uuid "manager_id", null: false
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_updates_on_campaign_id"
    t.index ["manager_id"], name: "index_updates_on_manager_id"
  end

  add_foreign_key "account_login_change_keys", "accounts", column: "id"
  add_foreign_key "account_password_reset_keys", "accounts", column: "id"
  add_foreign_key "account_remember_keys", "accounts", column: "id"
  add_foreign_key "account_verification_keys", "accounts", column: "id"
  add_foreign_key "profiles", "accounts"
end
