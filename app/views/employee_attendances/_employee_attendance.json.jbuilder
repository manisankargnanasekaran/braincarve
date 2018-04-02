json.extract! employee_attendance, :id, :employee_id, :leave_period, :day_count, :reason, :created_at, :updated_at
json.url employee_attendance_url(employee_attendance, format: :json)
