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

ActiveRecord::Schema.define(version: 20180602133643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.text "products_code"
    t.text "added_date"
    t.text "mrp"
    t.text "brands_code"
    t.text "categories_code"
    t.text "group_code"
    t.text "seasons_code"
    t.text "story_code"
    t.text "products_title"
    t.text "products_descriptiont"
    t.text "products_color"
    t.text "products_fabric"
    t.text "products_washcare"
    t.text "products_sleev"
    t.text "products_neck"
    t.text "products_length"
    t.text "stylist_says"
    t.text "tax_percent"
    t.text "product_sizes"
    t.text "product_varients"
    t.text "product_team"
    t.text "archived"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
