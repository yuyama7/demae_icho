class AddSomeColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :location, :string, null: false, default: ""
    add_column :users, :account_type, :integer, null: false, default: 0
  end
end
