# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.


ActiveRecord::Schema.define(:version => 20101108034231) do

  create_table "activities", :force => true do |t|
    t.string   "title"
    t.text     "specification"
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  create_table "courses", :force => true do |t|
    t.string   "name",       :limit => 60
    t.string   "code",       :limit => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.integer  "year"
    t.integer  "semester"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teacher_id"
    t.integer  "course_id"
  end


  create_table "students", :force => true do |t|
    t.string   "name",         :limit => 100
    t.string   "email",        :limit => 100
    t.integer  "registration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students_groups", :id => false, :force => true do |t|
    t.integer "student_id"
    t.integer "group_id"
  end

  create_table "teachers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "registration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
