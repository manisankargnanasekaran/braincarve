json.extract! user, :id, :first_name, :last_name, :mobile_number, :email_id, :gender, :address, :dob, :created_at, :updated_at
json.url user_url(user, format: :json)
