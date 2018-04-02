Rails.application.routes.draw do


  get "reports/renewal_report"
  get "reports/dynamic_renewal_data"

  get "agreement_renewals/form"
  post "agreement_renewals/form"

  get "users/franchisee_profile"

  get "due_payslip" => "installment_details#due_royalty_pay_slip"
  post "installment_details/update_franchisee_due_royalty_payment"
  get "due_paydetail" => "installment_details#due_royalty_payment_detail"

  get "installment_details/due_royalty_amount"
  
  post "franchisees/emailcheck"

  get "students/deactivate_student"
  get "students/activate_student"

  get "students/deactivated_student_list"

  get "student_fee_pays/fees_receipt"

  get "franchisee_payslip" => "royalty_details#franchisee_royalty_pay_slip"
  post "royalty_details/update_franchisee_royalty_payment"
  get "franchisee_paydetail" => "royalty_details#franchisee_royalty_payment_detail"

  get "company_payslip" => "company_royalty_details#company_royalty_pay_slip"
  post "company_royalty_details/update_company_royalty_payment"
  get "company_paydetail" => "company_royalty_details#company_royalty_payment_detail"

  post "installment_details/installment_pay"

  get "installment_details/franchisee_payment_detail"

  get "installment_details/franchisee_pay_slip"
  post "installment_details/franchisee_pay_slip"

  get "royalty_details/royalty"
  get "royalty_details/company"
  get "royalty_details/franchisee_royalty"
  get "royalty_details/current_month_royalty"
  get "royalty_details/get_month_year_franchisee_child_royalty"
  get "royalty_details/current_month_company_royalty"
  get "royalty_details/get_month_year_company_royalty"
  get "pay_status" => "royalty_details#pay_status"
  get "our_pay_status" => "royalty_details#our_pay_status"
  get "our_company_pay" => "royalty_details#our_company_pay"
  get "royalty_pay_to_company" => "royalty_details#royalty_pay_to_company"
  get "royalty_details/pay_status_updation"
  get "announcements/announcement_deactive"

  get 'royalty_details/change_status_true'
  get 'royalty_details/change_status_false'

  get "order_requests/invoice_detail"

  get "invoices/invoice_payment_detail"

  get "invoices/invoice_pay_slip"
  post "invoices/invoice_pay_slip"

  get "purchases/item_check"

  get "purchases/payment_detail"

  get "purchases/pay_slip"
  post "purchases/pay_slip"

  #get "purchases/amount_calculation"

  get "employee_attendances/get_month_year_leave"

  get "emp_monthly_salaries/get_month_year_salary"
  post "emp_monthly_salaries/get_month_year_salary"
    
  get "employee_attendances/monthly_leave"

  get "employee_attendances/leave"
  post "employee_attendances/leave"

  get "print_franchisee" => "franchisees#print_franchisee"
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#validate_logins'
  get 'logout' => 'sessions#destroy'
  
  get "franchisees/franchisee_agreement"
  post "franchisees/franchisee_agreement"

  get "franchisees/get_type"
  post "franchisees/get_type"

  get "franchisees/dashboard"
  
  get "sessions/forgot_password"
  post "sessions/forgot_password"
  
  get "sessions/forgot_password_link"
  post "sessions/forgot_password_link"

  get  "reset_password" => "sessions#reset_password", :as => "reset_password"
  post "sessions/reset_password"
  
  post "users/update_new_password"

  
  get "franchisees/franchisee_level"
  
  get "student_attendance"=>"students#student_attendance"
  post "student_attendance"=>"students#student_attendance_create"
  get "attendance_destroy"=>"students#attendance_destroy"
  get "franchisee_dashboard" => "franchisees#franchisee_dashboard"

  get "student_reports" => "reports#student_reports"
  get "student_report_show" => "reports#student_report_show"
  get "student_report_generates" => "reports#student_report_generates"

  get "upgrade_level" => "students#level_show"
  get "student_detail_show" => "students#student_details_show"

  get "student_level_update" => "students#student_level_update"

  get "franchisee_tree" => "franchisees#franchisee_tree"

  get "students_report"=> "reports#all_student_report"

  get "reports/monthwise_student_report"
  get "reports/report_xls_generate"
  get "reports/income"
  get "reports/dynamic_income"



  get "expense_category"=>"expenses#expense_category"
  post "expense_category"=>"expenses#expense_category_create"

  
  resources :agreement_renewals
  resources :expenses

  resources :vendors
  
  resources :announcement_fors
  resources :announcements

  resources :company_royalty_details
  resources :royalty_details
  resources :student_fee_pays
  
  resources :student_fee_pays
  resources :invoice_payments
  resources :invoice_items
  resources :invoices
  resources :order_request_items
  resources :order_requests

  resources :franchisee_inventory_stocks
  resources :installment_details

  resources :franchisee_inventory_stocks
  resources :invoice_payments
  resources :invoice_items
  resources :invoices
  resources :order_request_items
  resources :order_requests
  resources :payments
  resources :purchase_items
  resources :purchases
  resources :company_inventory_stocks

  resources :emp_monthly_salaries
  resources :student_details
  resources :students
  resources :franchisee_agreements
  resources :franchisee_contacts
  resources :franchisee_personals
  resources :franchisees
  resources :users
  resources :employee_attendances
  resources :inventory_items
  resources :employee_contacts
  resources :employee_personals
  resources :employee_salaries
  resources :employees
  resources :roles
  resources :batches

  root "franchisees#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   mount SubdivisionSelect::Engine, at: 'subdivisions'
end
