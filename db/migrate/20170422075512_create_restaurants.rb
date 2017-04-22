class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.integer :user_id
      t.string :name
      t.string :location
      t.float :delivery_charge

      t.timestamps
    end
  end
end
