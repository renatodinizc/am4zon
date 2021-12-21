Rails.application.routes.draw do

  devise_for :users
  devise_for :admins
  root to: 'home#index'

  resources :users, only: %i[show edit update]

  resources :books, only: [:show]
end
