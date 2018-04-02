json.extract! order_request_item, :id, :order_request_id, :inventory_item_id, :request_qty, :cost_per_item, :amount, :created_at, :updated_at
json.url order_request_item_url(order_request_item, format: :json)
