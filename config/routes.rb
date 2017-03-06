Rails.application.routes.draw do
  post 'particle/pour'

  get 'charges/select'
  get 'charges/thanks'
  get 'charges/confirm'
  get 'charges/menu'

  get 'route_man/refresh'
  get 'route_man/calc'
  get "route_man/loaded_products" => 'route_man#loaded_products', :as => :loaded_products
  get "route_man/remove_product"

  mount Facebook::Messenger::Server, at: "bot"

  get 'particle/enable'
  get 'particle/buy'

  root to: 'visitors#index'
  resources :consumer_purchases
  resources :product_loads
  resources :vending_machines do
    resources :free_periods
  end
  resources :routes
  resources :owners
  resources :local_products
  resources :charges
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
