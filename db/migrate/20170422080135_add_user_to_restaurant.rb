class AddUserToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :restaurants, :user, column: :user_id, foreign_key: true, index: true
  end
end
