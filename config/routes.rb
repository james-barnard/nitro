Rails.application.routes.draw do
  get 'route_man/calc'

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
