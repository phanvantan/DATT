json.extract! tour_booking, :id, :tour_detail_id, :name, :price, :status, :time, :created_at, :updated_at
json.url tour_booking_url(tour_booking, format: :json)
