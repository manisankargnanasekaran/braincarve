json.extract! purchase, :id, :purchase_date, :vendor_name, :paid_status, :bill_no, :total_amount, :balance_amount, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
