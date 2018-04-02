json.extract! student, :id, :student_name, :dob, :age, :gender, :student_class, :address, :contact_no, :school_name, :school_location, :registration_date, :created_at, :updated_at
json.url student_url(student, format: :json)
