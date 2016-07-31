Rails.application.routes.draw do
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
