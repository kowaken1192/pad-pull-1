Rails.application.routes.draw do
  devise_for :users
  resources :rooms
  get 'accounts/show'
  resources :posts
  root "posts#index"
  resources :users
  resource :account, only: [:edit, :update, :show]
  get '/account', to: 'accounts#show'
  get '/users', to: 'users#show'
  get '/rooms', to: 'rooms#new'
  post '/rooms', to: 'rooms#update'
  get 'rooms/search', to: 'rooms#search'
  post 'house', to: 'house#index'
  post '/rooms/search', to: 'rooms#search'
  post 'rooms', to: 'rooms#create'
  resources :house, only: :index
  
  get '/reservations/confirm', to: 'reservations#confirm', as: 'confirm_reservation'
  post '/reservations/confirm', to: 'reservations#confirm'
  
  resources :reservations do
    member do
      post 'confirm' ,to: 'reservations#confirm'
    end
  end
end
