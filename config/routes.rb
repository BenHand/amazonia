Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :orders
  resources :products
  post '/add_to_cart/:user_id/product/:product_id', to: 'orders#create', as: 'cart'
  root to: "products#index"
end
