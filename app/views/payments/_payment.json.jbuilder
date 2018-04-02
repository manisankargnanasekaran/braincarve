json.extract! payment, :id, :purchase_id, :payment_mode, :reference_no, :amount_paid, :created_at, :updated_at
json.url payment_url(payment, format: :json)
