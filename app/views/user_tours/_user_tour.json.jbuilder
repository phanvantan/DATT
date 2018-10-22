json.extract! user_tour, :id, :user_id, :tour_id, :created_at, :updated_at
json.url user_tour_url(user_tour, format: :json)
