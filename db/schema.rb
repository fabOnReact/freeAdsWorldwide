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

ActiveRecord::Schema.define(version: 20170509121310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "run_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "visits"
    t.boolean  "selfpromotion"
    t.index ["company_id"], name: "index_ads_on_company_id", using: :btree
    t.index ["run_id"], name: "index_ads_on_run_id", using: :btree
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.string   "targetcountries"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "campaigntype_id"
    t.integer  "company_id"
    t.boolean  "worldwide"
    t.boolean  "america"
    t.boolean  "europe"
    t.boolean  "asia"
    t.boolean  "oceania"
    t.integer  "givenvisits"
    t.integer  "obtainedvisits"
    t.integer  "visitratio"
    t.integer  "ads_received"
    t.index ["campaigntype_id"], name: "index_campaigns_on_campaigntype_id", using: :btree
    t.index ["company_id"], name: "index_campaigns_on_company_id", using: :btree
  end

  create_table "campaigntypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "companytype_id"
    t.string   "name"
    t.string   "title"
    t.string   "description"
    t.string   "website"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["companytype_id"], name: "index_companies_on_companytype_id", using: :btree
  end

  create_table "companies_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
    t.index ["company_id"], name: "index_companies_users_on_company_id", using: :btree
    t.index ["user_id"], name: "index_companies_users_on_user_id", using: :btree
  end

  create_table "companytypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promotions", force: :cascade do |t|
    t.integer  "campaigntype_id"
    t.integer  "campaign_id"
    t.integer  "company_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["campaign_id"], name: "index_promotions_on_campaign_id", using: :btree
    t.index ["campaigntype_id"], name: "index_promotions_on_campaigntype_id", using: :btree
    t.index ["company_id"], name: "index_promotions_on_company_id", using: :btree
  end

  create_table "runs", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "campaign_id"
    t.integer  "runprintnumber"
    t.integer  "ownads"
    t.string   "status"
    t.index ["campaign_id"], name: "index_runs_on_campaign_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "country"
    t.string   "city"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "ads", "companies"
  add_foreign_key "ads", "runs"
  add_foreign_key "campaigns", "campaigntypes"
  add_foreign_key "campaigns", "companies"
  add_foreign_key "companies", "companytypes"
  add_foreign_key "runs", "campaigns"
end
