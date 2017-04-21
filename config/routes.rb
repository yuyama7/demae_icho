Rails.application.routes.draw do
  resources :restaurants do
    resources :menus
  end
  get 'search_restaurants', to: 'restaurants#search'
  resources :order_items
  resources :orders
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
