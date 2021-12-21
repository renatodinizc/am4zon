Rails.application.routes.draw do

  devise_for :users
  devise_for :admins
  root to: 'home#index'

  resources :admins, only: [:show]
  resources :users, only: %i[show edit update]

  resources :authors, only: %i[new create]
  resources :books, only: %i[show new create]
end