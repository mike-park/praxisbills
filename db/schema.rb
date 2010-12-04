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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101203233457) do

  create_table "auths", :force => true do |t|
    t.string   "doctor"
    t.integer  "max_sessions", :default => 0
    t.boolean  "billed",       :default => false
    t.integer  "patient_id",                      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_id"
    t.decimal  "rec_amount"
    t.integer  "insurer_id",                      :null => false
  end

  create_table "bill_items", :force => true do |t|
    t.integer  "auth_id",                                  :null => false
    t.integer  "therapy_id",                               :null => false
    t.integer  "quantity",                                 :null => false
    t.decimal  "unit_price", :precision => 8, :scale => 2, :null => false
    t.decimal  "total",      :precision => 8, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurers", :force => true do |t|
    t.string   "abbr",                :null => false
    t.string   "name",                :null => false
    t.integer  "active_pricelist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurers_pricelists", :id => false, :force => true do |t|
    t.integer "insurer_id",   :null => false
    t.integer "pricelist_id", :null => false
  end

  create_table "invoices", :force => true do |t|
    t.date     "sent_date",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "open",       :default => true
  end

  create_table "patients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name",  :null => false
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "invoice_id",                               :null => false
    t.date     "rec_date",                                 :null => false
    t.decimal  "amount",     :precision => 8, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
  end

  create_table "pricelists", :force => true do |t|
    t.date     "start_date", :null => false
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "therapies", :force => true do |t|
    t.integer  "code",                               :null => false
    t.decimal  "price",             :default => 0.0, :null => false
    t.string   "short_description"
    t.text     "description"
    t.date     "valid_from"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pricelist_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
