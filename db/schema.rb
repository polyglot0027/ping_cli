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

ActiveRecord::Schema.define(version: 20170518100043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hosts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_hosts_on_name", unique: true
  end

  create_table "log_entries", force: :cascade do |t|
    t.integer "ping_ms"
    t.boolean "received", default: true
    t.bigint "host_id", null: false
    t.datetime "created_at", null: false
    t.index ["created_at"], name: "index_log_entries_on_created_at"
    t.index ["host_id"], name: "index_log_entries_on_host_id"
  end

end
