json.extract! invoice, :id, :invoice_date, :order_request_id, :total_amount, :balance_amount, :paid_status, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
