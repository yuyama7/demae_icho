Rails.application.routes.draw do
  resources :restaurants do
    resources :menus
  end
  resources :order_items
  resources :orders
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/restaurant/:id/customer_orders', to: 'restaurants#customer_orders', as: 'customer_orders'
  get '/restaurant/:id/customer_orders/list', to: 'restaurants#customer_orders_list', as: 'customer_orders_list'
end
