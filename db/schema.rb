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

ActiveRecord::Schema.define(version: 2018_10_07_054859) do

  create_table "areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "areaName"
    t.integer "area_level"
    t.integer "area_sequence"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bizcases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "bizcase_author"
    t.string "bizcase_date"
    t.string "bizcase_title"
    t.string "bizcase_content"
    t.string "bizcase_status"
    t.datetime "bizcase_modified"
    t.string "bizcase_type"
    t.string "bizcase_link"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaigns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "start"
    t.float "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "cases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "case_author"
    t.string "case_date"
    t.string "case_title"
    t.string "case_content"
    t.string "case_status"
    t.datetime "case_modified"
    t.string "case_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "parent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category_type"
  end

  create_table "comments", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "post_id"
    t.string "comment_content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "schedule_id"
    t.integer "order_id"
    t.integer "step_order"
    t.integer "campaign_id"
  end

  create_table "contracts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "creator_id"
    t.integer "marketer_id"
    t.integer "campaigns_id"
    t.float "contract_price"
    t.datetime "down_payment_date"
    t.float "down_payment"
    t.datetime "rest_payment_date"
    t.float "rest_payment"
    t.string "contract_image"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "creator_exts", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userid"
    t.string "tags_set"
    t.string "avatar"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "inviterequired"
    t.string "productselected"
  end

  create_table "creator_metrics", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "creator_id"
    t.string "metric_id"
    t.string "metric_name"
    t.string "metric_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flows", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "flow_type"
    t.string "flow_name"
    t.integer "flow_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marketer_exts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "userid"
    t.integer "category_id"
    t.string "companyname"
    t.string "companyaddress"
    t.string "taxcode"
    t.string "bankname"
    t.string "bankaccount"
    t.string "contactname"
    t.string "contactmobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
    t.integer "step_order"
    t.integer "user_id"
    t.string "creatorstatus"
    t.string "marketerstatus"
    t.string "adminstatus"
  end

  create_table "metrics", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "marketer_id"
    t.float "budget"
    t.datetime "start_date"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id"
    t.string "status"
  end

  create_table "posts", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "post_author"
    t.string "post_date"
    t.string "post_title"
    t.string "post_content"
    t.string "post_status"
    t.datetime "post_modified"
    t.string "post_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "schedule_id"
  end

  create_table "reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "report_author"
    t.string "report_date"
    t.string "report_title"
    t.string "report_content"
    t.string "report_status"
    t.datetime "post_modified"
    t.string "report_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "report_source"
    t.string "report_link"
  end

  create_table "schedules", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "flow_name"
    t.integer "flow_order"
    t.datetime "starts_on"
    t.datetime "ends_on"
    t.integer "workdays"
    t.integer "status"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "flow_id"
    t.integer "order_id"
  end

  create_table "services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "service_name"
    t.string "service_description"
    t.float "service_price"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "creator_id"
    t.integer "channel_id"
    t.string "channel_name"
    t.string "channel_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fans"
    t.integer "readers"
    t.integer "comments"
    t.integer "praises"
    t.string "nickname"
  end

  create_table "social_channels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tag_type"
    t.string "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "duration"
    t.date "due_date"
    t.boolean "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "testAdd"
  end

  create_table "user_exts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.string "companyname"
    t.string "companyaddress"
    t.string "taxcode"
    t.string "bankname"
    t.string "bankaccount"
    t.string "contactname"
    t.string "contactmobile"
    t.string "tags_set"
    t.string "avatar"
    t.string "inviterequired"
    t.string "productselected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_tags", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tag_id"
  end

  create_table "users", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "status"
    t.string "usertype"
    t.string "username"
    t.string "truename"
    t.string "password"
    t.integer "province_id"
    t.integer "city_id"
    t.integer "distirct_id"
    t.string "address"
    t.string "user_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mobile"
    t.string "description"
    t.string "sex"
    t.string "nickname"
    t.string "avatar"
  end

end
