User.create!([
  {email: "customer@bibo.com", password: "password", encrypted_password: "$2a$11$TpJ8AQVyrifelTrPdGwLx.AmW63NyYnhLwpzeHttMzIGHg1sqDrMC", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2017-04-22 06:03:22", last_sign_in_at: "2017-04-22 05:57:28", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "customer", location: "BGC", account_type: "customer"},
  {email: "owner@bibo.com", password: "password", encrypted_password: "$2a$11$Ndpyou8ZsAYRYDTNrgfaRupgoGEDvMWvBn25phHtaCUOf6e8xjUAW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2017-04-22 06:04:12", last_sign_in_at: "2017-04-22 05:58:00", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "owner", location: "BGC", account_type: "owner"}
])
Menu.create!([
  {restaurant_id: 1, name: "cheese burger", description: "cheesy", image_path: "", price: 125.0},
  {restaurant_id: 1, name: "coke", description: "soda", image_path: "", price: 50.0},
  {restaurant_id: 1, name: "fries", description: "french fries", image_path: "", price: 55.0}
])
Order.create!([
  {user_id: 1, restaurant_id: 1, status: "accepted"}
])
OrderItem.create!([
  {order_id: 1, menu_id: 1},
  {order_id: 1, menu_id: 2},
  {order_id: 1, menu_id: 3}
])
Restaurant.create!([
  {user_id: 2, name: "mcdonald", location: "BGC", delivery_charge: 100.0}
])
