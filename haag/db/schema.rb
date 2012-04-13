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

ActiveRecord::Schema.define(:version => 20120413210016) do

  create_table "assignments", :force => true do |t|
    t.string   "description"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "due_at"
    t.integer  "user_id"
  end

  add_index "assignments", ["course_id"], :name => "index_assignments_on_course_id"

  create_table "courses", :force => true do |t|
    t.string   "short_name"
    t.string   "long_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
  end

  create_table "courses_users", :id => false, :force => true do |t|
    t.integer "course_id"
    t.integer "user_id"
  end

  create_table "messages", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["assignment_id"], :name => "index_messages_on_assignment_id"
  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "tasks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["assignment_id"], :name => "index_tasks_on_assignment_id"
  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
