Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#index'
  get 'shop' => 'pages#shop'

  resources :carts
  resources :product_items
  resources :orders

get 'product/:number', to: 'pages#show', as: 'product', number: /\d+/
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get 'about', to: 'pages#about', as: 'about'
get 'contact', to: 'pages#contact', as: 'contact'
end
