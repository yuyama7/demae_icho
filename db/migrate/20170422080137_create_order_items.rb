class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false
      t.integer :menu_id, null: false
      t.timestamps
    end
  end
end
