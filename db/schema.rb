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

ActiveRecord::Schema.define(:version => 20130622184716) do

  create_table "buddy_pairs", :force => true do |t|
    t.integer       "team_id",                              :null => false
    t.integer_array "permutation",                          :null => false
    t.boolean       "has_been_assigned", :default => false, :null => false
    t.datetime      "created_at",                           :null => false
    t.datetime      "updated_at",                           :null => false
  end

  add_index "buddy_pairs", ["permutation", "team_id"], :name => "index_buddy_pairs_on_permutation_and_team_id"
  add_index "buddy_pairs", ["team_id"], :name => "index_buddy_pairs_on_team_id"

  create_table "people", :force => true do |t|
    t.string   "name",          :null => false
    t.string   "email",         :null => false
    t.integer  "buddy_pair_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "people", ["email"], :name => "index_people_on_email", :unique => true

  create_table "team_assignments", :force => true do |t|
    t.integer  "person_id"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "team_assignments", ["person_id", "team_id"], :name => "index_team_assignments_on_person_id_and_team_id", :unique => true
  add_index "team_assignments", ["person_id"], :name => "index_team_assignments_on_person_id"
  add_index "team_assignments", ["team_id"], :name => "index_team_assignments_on_team_id"

  create_table "teams", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "teams", ["name"], :name => "index_teams_on_name", :unique => true

end
