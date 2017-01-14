Rails.application.routes.draw do
  get 'route_man/refresh'
  get 'route_man/calc'
  get "route_man/loaded_products" => 'route_man#loaded_products', :as => :loaded_products
  get "route_man/remove_product"

  mount Messenger::Engine, at: "/messenger"

  get 'particle/enable'
  get 'particle/buy'

  root to: 'visitors#index'
  resources :consumer_purchases
  resources :product_loads
  resources :vending_machines
  resources :routes
  resources :owners
  resources :local_products
  resources :products
  resources :pos_vehicles
  resources :consumers
  resources :breweries
  resources :people
  resources :regions
  resources :organizations
  resources :locations
  devise_for :users
  resources :users
end
