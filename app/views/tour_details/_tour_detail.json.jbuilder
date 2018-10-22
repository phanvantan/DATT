json.extract! tour_detail, :id, :tour_id, :employee_id, :place_id, :start_day, :end_day, :created_at, :updated_at
json.url tour_detail_url(tour_detail, format: :json)
