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

ActiveRecord::Schema.define(version: 20170703213952) do

  create_table "borrower_payments", force: :cascade do |t|
    t.float "amount"
    t.integer "borrower_id"
  end

  create_table "borrower_purchases", force: :cascade do |t|
    t.float "amount"
    t.string "seller"
    t.integer "card_id"
  end

  create_table "borrowers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "phone_number"
    t.string "email"
    t.string "address"
    t.boolean "approved", default: false
    t.bigint "social_security"
  end

  create_table "cards", force: :cascade do |t|
    t.integer "borrower_id"
    t.integer "credit_line"
    t.boolean "active", default: true
  end

  create_table "employers", force: :cascade do |t|
    t.string "name"
    t.integer "payroll_company_id"
  end

  create_table "employment_histories", force: :cascade do |t|
    t.integer "borrower_id"
    t.integer "employer_id"
    t.float "salary"
    t.date "start_date"
    t.date "end_date"
    t.string "job_title"
  end

  create_table "payroll_companies", force: :cascade do |t|
    t.string "name"
  end

end
