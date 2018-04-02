json.extract! student_detail, :id, :student_id, :father_name, :father_occupation, :father_email, :father_contact_no, :mother_name, :mother_occupation, :mother_email, :mother_contact_no, :known_by, :reason_to_enroll, :created_at, :updated_at
json.url student_detail_url(student_detail, format: :json)
