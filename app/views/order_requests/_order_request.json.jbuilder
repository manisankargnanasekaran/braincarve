json.extract! order_request, :id, :order_date, :franchisee_id, :created_at, :updated_at
json.url order_request_url(order_request, format: :json)
