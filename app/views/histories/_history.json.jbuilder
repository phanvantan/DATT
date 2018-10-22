json.extract! history, :id, :user_id, :tour_booking_id, :status, :created_at, :updated_at
json.url history_url(history, format: :json)
