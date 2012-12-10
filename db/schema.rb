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

ActiveRecord::Schema.define(:version => 20120103172823) do

  create_table "activities", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.integer   "org_id"
    t.integer   "user_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "organization"
    t.integer   "impact"
    t.integer   "reward"
    t.timestamp "starttime"
    t.timestamp "endtime"
    t.decimal   "duration"
    t.integer   "worker1"
    t.integer   "worker2"
    t.integer   "worker3"
    t.integer   "worker4"
    t.integer   "worker5"
  end

  add_index "activities", ["org_id"], :name => "index_activities_on_org_id"
  add_index "activities", ["user_id"], :name => "index_activities_on_user_id"

  create_table "donations", :force => true do |t|
    t.integer   "org_id"
    t.integer   "user_id"
    t.integer   "kind"
    t.decimal   "value"
    t.text      "description"
    t.string    "made_by"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "datemade"
  end

  create_table "orgs", :force => true do |t|
    t.string    "organization"
    t.string    "division"
    t.string    "address"
    t.string    "city"
    t.string    "description"
    t.string    "background"
    t.integer   "user_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "avatar_file_name"
    t.string    "avatar_content_type"
    t.integer   "avatar_file_size"
    t.timestamp "avatar_updated_at"
  end

  add_index "orgs", ["user_id"], :name => "index_orgs_on_user_id"

  create_table "users", :force => true do |t|
    t.string    "email",                                 :default => "", :null => false
    t.string    "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                         :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "first_name"
    t.string    "last_name"
    t.string    "username"
    t.string    "address"
    t.string    "city"
    t.string    "facebook"
    t.text      "comments"
    t.integer   "role"
    t.string    "avatar_file_name"
    t.string    "avatar_content_type"
    t.integer   "avatar_file_size"
    t.timestamp "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
