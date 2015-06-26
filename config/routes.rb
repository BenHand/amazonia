Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :orders
  resources :products
  root to: "products#index"
end
