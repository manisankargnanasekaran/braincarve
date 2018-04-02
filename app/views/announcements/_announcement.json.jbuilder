json.extract! announcement, :id, :announcement_date, :message, :is_for_all, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
