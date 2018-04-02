json.extract! employee, :id, :employee_identity, :prefix, :first_name, :last_name, :email_id, :department, :job_title, :date_of_joining, :created_at, :updated_at
json.url employee_url(employee, format: :json)
