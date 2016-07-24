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

ActiveRecord::Schema.define(:version => 20090801024601) do

  create_table "admins", :force => true do |t|
    t.integer  "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", :force => true do |t|
    t.string   "uid"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["uid"], :name => "index_attachments_on_uid", :unique => true

  create_table "companies", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string "name",     :null => false
    t.string "fullname", :null => false
  end

  create_table "dept_progs", :force => true do |t|
    t.string "dept_prog", :limit => 2048
  end

  create_table "dual_datas", :force => true do |t|
    t.integer  "student_id", :null => false
    t.float    "ug_cpi",     :null => false
    t.float    "pg_cpi",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_applications", :force => true do |t|
    t.integer  "job_opening_id", :null => false
    t.integer  "student_id",     :null => false
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_openings", :force => true do |t|
    t.integer  "company_id",                           :null => false
    t.string   "nature",                               :null => false
    t.string   "designation",                          :null => false
    t.text     "description",                          :null => false
    t.boolean  "intern",                               :null => false
    t.string   "package_btech"
    t.string   "package_mtech"
    t.string   "package_dual"
    t.string   "package_msci"
    t.string   "package_msc2"
    t.string   "package_mba"
    t.string   "package_mdes"
    t.string   "package_phd"
    t.string   "package_details"
    t.boolean  "bond",                                 :null => false
    t.string   "bond_details"
    t.string   "medical_requirements",                 :null => false
    t.boolean  "resume_shortlist",                     :null => false
    t.string   "resume_criteria"
    t.boolean  "aptitude",                             :null => false
    t.boolean  "gd",                                   :null => false
    t.boolean  "tech_test",                            :null => false
    t.boolean  "tech_interview",                       :null => false
    t.integer  "no_rounds",                            :null => false
    t.boolean  "hr_interview",                         :null => false
    t.string   "contact_details1",     :limit => 1024, :null => false
    t.string   "contact_details2",     :limit => 1024
    t.string   "contact_details3",     :limit => 1024
    t.boolean  "published",                            :null => false
    t.datetime "application_deadline",                 :null => false
    t.string   "eligibility",          :limit => 1024, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_types", :force => true do |t|
    t.string "job_type", :null => false
  end

  create_table "notices", :force => true do |t|
    t.string   "title",                      :null => false
    t.string   "attachment"
    t.string   "sent_to",    :limit => 1024, :null => false
    t.text     "content",                    :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "pg_datas", :force => true do |t|
    t.integer  "student_id",     :null => false
    t.string   "ug_college",     :null => false
    t.string   "ug_performance", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phd_datas", :force => true do |t|
    t.integer  "student_id"
    t.string   "ug_college"
    t.string   "ug_performance"
    t.string   "pg_college"
    t.string   "pg_performance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preferences", :force => true do |t|
    t.integer "pref1", :null => false
    t.integer "pref2", :null => false
    t.integer "pref3", :null => false
    t.integer "pref4", :null => false
    t.integer "pref5", :null => false
    t.integer "pref6", :null => false
    t.integer "pref7", :null => false
    t.integer "pref8", :null => false
  end

  create_table "programs", :force => true do |t|
    t.string "name",     :limit => 10, :null => false
    t.string "fullname",               :null => false
  end

  create_table "student_datas", :force => true do |t|
    t.integer  "student_id",          :null => false
    t.string   "father_name",         :null => false
    t.string   "iitk_email",          :null => false
    t.string   "alternate_email",     :null => false
    t.string   "mobile_no",           :null => false
    t.string   "friend_mobile_no",    :null => false
    t.string   "residence_phone_no",  :null => false
    t.string   "iitk_adress",         :null => false
    t.string   "home_address",        :null => false
    t.string   "marks_10",            :null => false
    t.string   "board_10",            :null => false
    t.string   "year_10",             :null => false
    t.string   "marks_12",            :null => false
    t.string   "board_12",            :null => false
    t.string   "year_12",             :null => false
    t.date     "bday",                :null => false
    t.string   "gender",              :null => false
    t.string   "category",            :null => false
    t.string   "guide1_name",         :null => false
    t.string   "guide1_email",        :null => false
    t.string   "guide2_name"
    t.string   "guide2_email"
    t.string   "exepected_grad_date", :null => false
    t.float    "cpi"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.integer  "department_id", :null => false
    t.integer  "program_id",    :null => false
    t.string   "roll_no",       :null => false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ug_datas", :force => true do |t|
    t.integer  "student_id",      :null => false
    t.string   "entrance_rank",   :null => false
    t.string   "place_of_intern", :null => false
    t.string   "ppo",             :null => false
    t.string   "spo_intern",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userlogins", :force => true do |t|
    t.string   "login",             :limit => 15, :null => false
    t.string   "crypted_password",                :null => false
    t.integer  "loginable_id"
    t.string   "loginable_type"
    t.string   "password_salt",     :limit => 40, :null => false
    t.string   "persistence_token",               :null => false
    t.datetime "last_request_at",                 :null => false
    t.datetime "last_login_at",                   :null => false
    t.string   "last_login_ip",     :limit => 16, :null => false
  end

end
