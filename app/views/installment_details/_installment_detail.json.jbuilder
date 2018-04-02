json.extract! installment_detail, :id, :franchisee_id, :installment_amount, :installment_date, :created_at, :updated_at
json.url installment_detail_url(installment_detail, format: :json)
