json.extract! expense, :id, :description, :date, :amount, :expense_category_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
