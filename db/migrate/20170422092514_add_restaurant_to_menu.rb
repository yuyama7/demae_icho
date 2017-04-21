class AddRestaurantToMenu < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :menus, :restaurant, column: :restaurant_id, foreign_key: true, index: true
  end
end
