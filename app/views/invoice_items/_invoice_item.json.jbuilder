json.extract! invoice_item, :id, :invoice_id, :inventory_item_id, :invoice_qty, :cost_per_item, :amount, :created_at, :updated_at
json.url invoice_item_url(invoice_item, format: :json)
