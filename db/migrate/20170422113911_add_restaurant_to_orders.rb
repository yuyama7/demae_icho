class AddRestaurantToOrders < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :orders, :restaurant, column: :restaurant_id, foreign_key: true, index: true
  end
end
