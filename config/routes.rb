Rails.application.routes.draw do
  devise_for :users

  resources :rooms
  resources :posts
  resources :users

  resource :account, only: [:edit, :update, :show]
  get '/account', to: 'accounts#show'
  get '/users', to: 'users#show'
  get 'rooms/search', to: 'rooms#search'

  root "posts#index"

  post 'house', to: 'house#index'
  post '/rooms/search', to: 'rooms#search'
  post '/reservations/confirm', to: 'reservations#confirm'
  get '/reservations/confirm', to: 'reservations#confirm', as: 'confirm_reservation'
 
  resources :reservations do
    member do
      post 'confirm', to: 'reservations#confirm'
    end
  end
end
