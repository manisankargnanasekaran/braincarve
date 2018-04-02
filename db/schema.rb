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

ActiveRecord::Schema.define(version: 20180209051811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreement_renewals", force: :cascade do |t|
    t.bigint "franchisee_id"
    t.date "renewed_date"
    t.bigint "franchisee_document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["franchisee_document_id"], name: "index_agreement_renewals_on_franchisee_document_id"
    t.index ["franchisee_id"], name: "index_agreement_renewals_on_franchisee_id"
  end

  create_table "announcement_fors", force: :cascade do |t|
    t.bigint "announcement_id"
    t.bigint "franchisee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_announcement_fors_on_announcement_id"
    t.index ["franchisee_id"], name: "index_announcement_fors_on_franchisee_id"
  end

  create_table "announcements", force: :cascade do |t|
    t.date "announcement_date"
    t.string "message"
    t.boolean "is_for_all"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deactivated"
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "attend_class"
    t.string "date"
    t.boolean "payment_status"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "batches", force: :cascade do |t|
    t.string "batch_no"
    t.string "day"
    t.string "batch_time"
    t.string "duration_in_hours"
    t.string "batch_end_time"
    t.string "duration_in_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.index ["created_by_id"], name: "index_batches_on_created_by_id"
  end

  create_table "company_inventory_stocks", force: :cascade do |t|
    t.bigint "inventory_item_id"
    t.integer "available_qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_item_id"], name: "index_company_inventory_stocks_on_inventory_item_id"
  end

  create_table "company_royalties", force: :cascade do |t|
    t.bigint "franchisee_id"
    t.float "student_royalty"
    t.float "franchisee_royalty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "royalty_type"
    t.index ["franchisee_id"], name: "index_company_royalties_on_franchisee_id"
  end

  create_table "company_royalty_details", force: :cascade do |t|
    t.bigint "franchisee_id"
    t.float "amount"
    t.boolean "royalty_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "paid_status"
    t.datetime "payment_date"
    t.string "payment_mode"
    t.string "reference_no"
    t.index ["franchisee_id"], name: "index_company_royalty_details_on_franchisee_id"
  end

  create_table "emp_monthly_salaries", force: :cascade do |t|
    t.bigint "employee_id"
    t.date "salary_for"
    t.integer "no_of_leave", default: 0
    t.decimal "net_salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_emp_monthly_salaries_on_employee_id"
  end

  create_table "employee_attendances", force: :cascade do |t|
    t.bigint "employee_id"
    t.datetime "leave_date"
    t.string "reason"
    t.datetime "apply_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_attendances_on_employee_id"
  end

  create_table "employee_contacts", force: :cascade do |t|
    t.bigint "employee_id"
    t.string "contact_no"
    t.string "address"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "pincode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_contacts_on_employee_id"
  end

  create_table "employee_personals", force: :cascade do |t|
    t.bigint "employee_id"
    t.string "gender"
    t.boolean "marrital_status"
    t.string "nationality"
    t.date "date_of_birth"
    t.string "blood_group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_personals_on_employee_id"
  end

  create_table "employee_salaries", force: :cascade do |t|
    t.bigint "employee_id"
    t.decimal "salary_amount"
    t.string "account_holder_name"
    t.string "account_number"
    t.string "ifsc_code"
    t.string "bank_name"
    t.string "account_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_salaries_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "employee_identity"
    t.string "prefix"
    t.string "first_name"
    t.string "last_name"
    t.string "email_id"
    t.string "department"
    t.string "job_title"
    t.date "date_of_joining"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_image_id"
    t.string "resume"
    t.index ["profile_image_id"], name: "index_employees_on_profile_image_id"
  end

  create_table "expense_categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string "description"
    t.datetime "date"
    t.decimal "amount"
    t.bigint "expense_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_category_id"], name: "index_expenses_on_expense_category_id"
  end

  create_table "franchisee_agreements", force: :cascade do |t|
    t.bigint "franchisee_id"
    t.date "agreement_date"
    t.integer "duration_in_month"
    t.date "renewal_date"
    t.string "location"
    t.integer "no_of_centers"
    t.decimal "amount"
    t.float "gst"
    t.decimal "total_amount_gst"
    t.decimal "advance_amount_gst"
    t.decimal "balance_amount_gst"
    t.integer "no_of_installment"
    t.string "center_address"
    t.string "city"
    t.string "state"
    t.string "pincode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "installment_detail"
    t.index ["franchisee_id"], name: "index_franchisee_agreements_on_franchisee_id"
  end

  create_table "franchisee_documents", force: :cascade do |t|
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "franchisee_inventory_stocks", force: :cascade do |t|
    t.bigint "franchisee_id"
    t.bigint "inventory_item_id"
    t.integer "available_qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["franchisee_id"], name: "index_franchisee_inventory_stocks_on_franchisee_id"
    t.index ["inventory_item_id"], name: "index_franchisee_inventory_stocks_on_inventory_item_id"
  end

  create_table "franchisee_owners", force: :cascade do |t|
    t.bigint "franchisee_id"
    t.string "salutation"
    t.string "first_name"
    t.string "last_name"
    t.string "contact_no"
    t.string "email_id"
    t.string "address"
    t.date "dob"
    t.integer "age"
    t.string "experience"
    t.string "occupation"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "id_proof"
    t.string "id_proof_number"
    t.index ["franchisee_id"], name: "index_franchisee_owners_on_franchisee_id"
  end

  create_table "franchisee_royalties", force: :cascade do |t|
    t.bigint "franchisee_id"
    t.integer "to_nf"
    t.integer "to_mf"
    t.integer "to_df"
    t.integer "to_uf"
    t.float "student_nf_royalty"
    t.float "student_mf_royalty"
    t.float "student_df_royalty"
    t.float "student_uf_royalty"
    t.float "franchisee_royalty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "franchisee_nf_royalty"
    t.float "franchisee_mf_royalty"
    t.float "franchisee_df_royalty"
    t.float "franchisee_uf_royalty"
    t.index ["franchisee_id"], name: "index_franchisee_royalties_on_franchisee_id"
  end

  create_table "franchisees", force: :cascade do |t|
    t.integer "franchisee_type"
    t.string "location"
    t.string "parent"
    t.integer "no_of_owners"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "franchisee_document_id"
    t.decimal "student_fee"
    t.date "latest_renewal"
    t.index ["franchisee_document_id"], name: "index_franchisees_on_franchisee_document_id"
    t.index ["user_id"], name: "index_franchisees_on_user_id"
  end

  create_table "installment_details", force: :cascade do |t|
    t.bigint "franchisee_id"
    t.decimal "installment_amount"
    t.date "installment_date"
    t.string "payment_mode"
    t.string "reference_no"
    t.boolean "paid_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "due_balance"
    t.decimal "actual_balance"
    t.date "payment_date"
    t.index ["franchisee_id"], name: "index_installment_details_on_franchisee_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.string "book"
    t.string "class_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "min_quantity"
    t.float "gst_percentage"
    t.string "unit"
    t.decimal "cost_per_item"
  end

  create_table "invoice_items", force: :cascade do |t|
    t.bigint "invoice_id"
    t.bigint "inventory_item_id"
    t.integer "invoice_qty"
    t.decimal "cost_per_item"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_item_id"], name: "index_invoice_items_on_inventory_item_id"
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
  end

  create_table "invoice_payments", force: :cascade do |t|
    t.bigint "invoice_id"
    t.date "payment_date"
    t.string "payment_mode"
    t.string "reference_no"
    t.decimal "amount_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_payments_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.date "invoice_date"
    t.bigint "order_request_id"
    t.decimal "total_amount"
    t.decimal "balance_amount"
    t.boolean "paid_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_request_id"], name: "index_invoices_on_order_request_id"
  end

  create_table "order_request_items", force: :cascade do |t|
    t.bigint "order_request_id"
    t.bigint "inventory_item_id"
    t.integer "request_qty"
    t.decimal "cost_per_item"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_item_id"], name: "index_order_request_items_on_inventory_item_id"
    t.index ["order_request_id"], name: "index_order_request_items_on_order_request_id"
  end

  create_table "order_requests", force: :cascade do |t|
    t.date "order_date"
    t.bigint "franchisee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["franchisee_id"], name: "index_order_requests_on_franchisee_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "purchase_id"
    t.datetime "payment_date"
    t.string "payment_mode"
    t.string "reference_no"
    t.decimal "amount_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_id"], name: "index_payments_on_purchase_id"
  end

  create_table "profile_images", force: :cascade do |t|
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_items", force: :cascade do |t|
    t.bigint "purchase_id"
    t.bigint "inventory_item_id"
    t.decimal "cost_per_item"
    t.integer "quantity"
    t.decimal "amount_without_gst"
    t.decimal "amount_with_gst"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_item_id"], name: "index_purchase_items_on_inventory_item_id"
    t.index ["purchase_id"], name: "index_purchase_items_on_purchase_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.datetime "purchase_date"
    t.string "vendor_name"
    t.boolean "paid_status"
    t.string "bill_no"
    t.decimal "total_amount"
    t.decimal "balance_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "vendor_id"
    t.index ["vendor_id"], name: "index_purchases_on_vendor_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_name"
    t.string "role_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "royalty_details", force: :cascade do |t|
    t.bigint "franchisee_id"
    t.integer "to_franchisee"
    t.float "amount"
    t.boolean "royalty_type"
    t.boolean "paid_status"
    t.datetime "payment_date"
    t.string "payment_mode"
    t.string "reference_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "due_date"
    t.index ["franchisee_id"], name: "index_royalty_details_on_franchisee_id"
  end

  create_table "student_details", force: :cascade do |t|
    t.bigint "student_id"
    t.string "father_name"
    t.string "father_occupation"
    t.string "father_email"
    t.string "father_contact_no"
    t.string "mother_name"
    t.string "mother_occupation"
    t.string "mother_email"
    t.string "mother_contact_no"
    t.string "known_by"
    t.string "reason_to_enroll"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_details_on_student_id"
  end

  create_table "student_fee_pays", force: :cascade do |t|
    t.float "amount"
    t.float "exclude_royalty"
    t.string "reference_number"
    t.datetime "dated"
    t.string "fee_type"
    t.string "payer_name"
    t.bigint "number_of_classes"
    t.bigint "student_detail_id"
    t.bigint "franchisee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_mode"
    t.string "level"
    t.index ["franchisee_id"], name: "index_student_fee_pays_on_franchisee_id"
    t.index ["student_detail_id"], name: "index_student_fee_pays_on_student_detail_id"
  end

  create_table "student_ratings", force: :cascade do |t|
    t.bigint "attendance_id"
    t.string "particular"
    t.integer "student_rating"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendance_id"], name: "index_student_ratings_on_attendance_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "student_name"
    t.date "dob"
    t.integer "age"
    t.integer "gender"
    t.string "student_class"
    t.string "address"
    t.string "contact_no"
    t.string "school_name"
    t.string "school_location"
    t.date "registration_date"
    t.bigint "batch_id"
    t.string "level"
    t.integer "current_level"
    t.boolean "student_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by_id"
    t.string "level_join"
    t.string "program"
    t.index ["batch_id"], name: "index_students_on_batch_id"
    t.index ["created_by_id"], name: "index_students_on_created_by_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_id"
    t.string "password_hash"
    t.string "password_salt"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "vendor_name"
    t.string "contact_no"
    t.string "vendor_address"
    t.float "gst_percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "agreement_renewals", "franchisee_documents"
  add_foreign_key "agreement_renewals", "franchisees"
  add_foreign_key "announcement_fors", "announcements"
  add_foreign_key "announcement_fors", "franchisees"
  add_foreign_key "attendances", "students"
  add_foreign_key "company_inventory_stocks", "inventory_items"
  add_foreign_key "company_royalties", "franchisees"
  add_foreign_key "company_royalty_details", "franchisees"
  add_foreign_key "emp_monthly_salaries", "employees"
  add_foreign_key "employee_attendances", "employees"
  add_foreign_key "employee_contacts", "employees"
  add_foreign_key "employee_personals", "employees"
  add_foreign_key "employee_salaries", "employees"
  add_foreign_key "employees", "profile_images"
  add_foreign_key "expenses", "expense_categories"
  add_foreign_key "franchisee_agreements", "franchisees"
  add_foreign_key "franchisee_inventory_stocks", "franchisees"
  add_foreign_key "franchisee_inventory_stocks", "inventory_items"
  add_foreign_key "franchisee_owners", "franchisees"
  add_foreign_key "franchisee_royalties", "franchisees"
  add_foreign_key "franchisees", "franchisee_documents"
  add_foreign_key "franchisees", "users"
  add_foreign_key "installment_details", "franchisees"
  add_foreign_key "invoice_items", "inventory_items"
  add_foreign_key "invoice_items", "invoices"
  add_foreign_key "invoice_payments", "invoices"
  add_foreign_key "invoices", "order_requests"
  add_foreign_key "order_request_items", "inventory_items"
  add_foreign_key "order_request_items", "order_requests"
  add_foreign_key "order_requests", "franchisees"
  add_foreign_key "payments", "purchases"
  add_foreign_key "purchase_items", "inventory_items"
  add_foreign_key "purchase_items", "purchases"
  add_foreign_key "royalty_details", "franchisees"
  add_foreign_key "student_details", "students"
  add_foreign_key "student_fee_pays", "franchisees"
  add_foreign_key "student_fee_pays", "student_details"
  add_foreign_key "student_ratings", "attendances"
  add_foreign_key "students", "batches"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
