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

ActiveRecord::Schema.define(:version => 20120201155940) do

  create_table "fixtures", :force => true do |t|
    t.string   "opposition"
    t.integer  "team_id"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fixtures_players", :id => false, :force => true do |t|
    t.integer "player_id"
    t.integer "fixture_id"
  end

  add_index "fixtures_players", ["player_id", "fixture_id"], :name => "index_fixtures_players_on_player_id_and_fixture_id"

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players_teams", :id => false, :force => true do |t|
    t.integer "player_id"
    t.integer "team_id"
  end

  add_index "players_teams", ["player_id", "team_id"], :name => "index_players_teams_on_player_id_and_team_id"

  create_table "subscriptions", :force => true do |t|
    t.string   "sub_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions_players", :id => false, :force => true do |t|
    t.integer "player_id"
    t.integer "subscription_id"
  end

  add_index "subscriptions_players", ["player_id", "subscription_id"], :name => "index_subscriptions_players_on_player_id_and_subscription_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "umpires", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
