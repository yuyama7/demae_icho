class AddSomeForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :orders, :restaurants, column: :restaurant_id, foreign_key: true, index: true
    add_foreign_key :orders, :users, column: :user_id, foreign_key: true, index: true
    add_foreign_key :order_items, :orders, column: :order_id, foreign_key: true, index: true
    add_foreign_key :order_items, :menus, column: :menu_id, foreign_key: true, index: true
  end
end
