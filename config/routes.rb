Rails.application.routes.draw do

  devise_for :users
  devise_for :admins
  root to: 'home#index'
  post 'search', to: 'home#search'

  namespace :api do
    namespace :v1 do
      resources :books, only: %i[index show create]
    end
  end
  
  resources :admins, only: [:show]
  resources :users, only: %i[show edit update]

  resources :authors, only: %i[show new create]
  resources :genres, only: %i[new create]
  resources :books, only: %i[show new create] do
    get 'buy', on: :member
  end
  resources :book_collections, only: %i[show new create]
end
