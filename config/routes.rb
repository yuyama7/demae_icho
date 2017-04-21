Rails.application.routes.draw do
  resources :restaurants do
    resources :menus
  end
  get 'search_restaurants', to: 'restaurants#search'
  post 'add_to_cart', to: 'menus#add_to_cart'
  post 'delete_from_cart', to: 'menus#delete_from_cart'
  resources :order_items
  resources :orders
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/restaurant/:id/customer_orders', to: 'restaurants#customer_orders', as: 'customer_orders'
  get '/restaurant/:id/customer_orders/list', to: 'restaurants#customer_orders_list', as: 'customer_orders_list'
end
