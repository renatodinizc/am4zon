Rails.application.routes.draw do

  devise_for :users
  devise_for :admins
  root to: 'home#index'
  post 'search', to: 'home#search'

  resources :admins, only: [:show]
  resources :users, only: %i[show edit update]

  resources :authors, only: %i[show new create]
  resources :genres, only: %i[new create]
  resources :books, only: %i[show new create]
  resources :book_collections, only: %i[show new create]
end
