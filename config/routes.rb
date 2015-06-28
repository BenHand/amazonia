Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :orders
  resources :products
  post '/add_to_cart/:user_id/product/:product_id', to: 'orders#create', as: 'cart'
  put '/remove_from_cart/:order_id/:product_id', to: 'orders#update', as: 'remove'
  root to: "products#index"
end
