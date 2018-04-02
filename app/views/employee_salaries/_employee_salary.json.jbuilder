json.extract! employee_salary, :id, :employee_id, :salary_amount, :account_holder_name, :account_number, :ifsc_code, :bank_name, :account_type, :created_at, :updated_at
json.url employee_salary_url(employee_salary, format: :json)
