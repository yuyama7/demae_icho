json.extract! menu, :id, :restaurant_id, :name, :description, :image_path, :price, :created_at, :updated_at
json.url menu_url(menu, format: :json)
