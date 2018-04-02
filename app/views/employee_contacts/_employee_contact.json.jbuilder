json.extract! employee_contact, :id, :employee_id, :contact_no, :address, :country, :state, :city, :pincode, :created_at, :updated_at
json.url employee_contact_url(employee_contact, format: :json)
