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

ActiveRecord::Schema.define(version: 20140206090850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "medical_conditions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medical_conditions_snps", force: true do |t|
    t.integer "medical_condition_id"
    t.integer "snp_id"
  end

  create_table "snpedia_articles", force: true do |t|
    t.integer  "revision"
    t.integer  "run_nr"
    t.integer  "snp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "xml"
  end

  create_table "snps", force: true do |t|
    t.string   "rs_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "variant_effects", force: true do |t|
    t.integer  "snp_id"
    t.string   "variant"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "magnitude"
  end

  add_index "variant_effects", ["snp_id"], name: "index_variant_effects_on_snp_id", using: :btree

end
