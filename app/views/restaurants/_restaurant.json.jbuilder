json.extract! restaurant, :id, :user_id, :name, :location, :delivery_charge, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
