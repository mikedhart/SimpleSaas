# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130225170654) do

  create_table "simple_saas_currencies", :force => true do |t|
    t.string   "name"
    t.string   "html_symbol"
    t.string   "short_code"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.float    "exchange_rate"
  end

  create_table "simple_saas_payment_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "simple_saas_payments", :force => true do |t|
    t.string   "transaction_id"
    t.string   "currency_id"
    t.integer  "payment_type_id"
    t.float    "amount"
    t.float    "rebased"
    t.text     "comment"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "subscription_id"
  end

  create_table "simple_saas_subscription_types", :force => true do |t|
    t.string   "name"
    t.integer  "duration"
    t.float    "cost"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "simple_saas_subscriptions", :force => true do |t|
    t.integer  "subscription_type_id"
    t.integer  "user_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.date     "renew_on"
    t.boolean  "active",               :default => false
  end

end
