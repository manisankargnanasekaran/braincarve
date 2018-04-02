json.extract! purchase_item, :id, :purchase_id, :inventory_item_id, :cost_per_item, :quantity, :amount_without_gst, :amount_with_gst, :created_at, :updated_at
json.url purchase_item_url(purchase_item, format: :json)
