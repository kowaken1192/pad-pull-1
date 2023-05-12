Rails.application.routes.draw do

  resources :reservations
  resources :rooms
  get 'accounts/show'
  devise_for :users
  resources :posts
  root "posts#index"
  resources :users
  resource :account, only: [:edit, :update,:show]
  get '/account', to: 'accounts#show'
  get '/users', to: 'users#show'
  get '/rooms',to:'rooms/#new'
  post '/rooms', to: 'rooms#update'
  get '/reservations', to: 'reservations#index'
  get '/reservations/new', to: 'reservations#new'
  get '/reservations/confirm', to: 'reservations#confirm', as: 'confirm_reservation'
  post '/reservations/confirm', to: 'reservations#confirm'
  get 'rooms/search' ,to: 'rooms#search'
  get 'house', to: 'house#index'
  resources :house, :only => :index 
  resources :reservations do
    member do
      post 'confirm' ,to: 'reservations#confirm'
    end
  end

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


