Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions", :passwords => "users/passwords"}

  resources :restaurants do
    resources :menus
  end
  get 'search_restaurants', to: 'restaurants#search'
  post 'add_to_cart', to: 'menus#add_to_cart'
  post 'delete_from_cart', to: 'menus#delete_from_cart'
  resources :orders
  resources :order_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/restaurant/:id/customer_orders', to: 'restaurants#customer_orders', as: 'customer_orders'
  get '/restaurant/:id/customer_orders/list', to: 'restaurants#customer_orders_list', as: 'customer_orders_list'
  post '/order/:id/update_status', to: 'orders#update_status', as: 'order_status_update'
end
