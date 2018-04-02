json.extract! invoice_payment, :id, :invoice_id, :payment_date, :payment_mode, :reference_no, :amount_paid, :created_at, :updated_at
json.url invoice_payment_url(invoice_payment, format: :json)
