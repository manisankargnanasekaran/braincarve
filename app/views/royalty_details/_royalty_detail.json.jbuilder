json.extract! royalty_detail, :id, :franchisee_id, :to_franchisee, :amount, :royalty_type, :created_at, :updated_at
json.url royalty_detail_url(royalty_detail, format: :json)
