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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150512225154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "trees", force: :cascade do |t|
    t.string   "name"
    t.text     "synonyms"
    t.string   "nicknames"
    t.string   "description"
    t.string   "habit"
    t.string   "exposure"
    t.string   "flowering_color"
    t.string   "blooming_period"
    t.string   "fruit_characteristics"
    t.string   "height"
    t.string   "width"
    t.string   "plant_character"
    t.string   "heat_tolerance"
    t.string   "water_requirements"
    t.string   "soil_requirements"
    t.integer  "usda_hardiness_zone"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
