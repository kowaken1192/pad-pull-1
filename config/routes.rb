Rails.application.routes.draw do
  resources :reservations, only: [:index]
  get 'reservations', to: 'reservations#index'
  resources :rooms
  get 'accounts/show'
  devise_for :users
  resources :posts
  root "posts#index"
  resources :users
  resource :account, only: [:edit, :update,:show]
  get '/account', to: 'accounts#show'
  get '/users', to: 'users#show'
  get '/rooms', to: 'rooms#new'
  post '/rooms', to: 'rooms#update'
  get '/reservations', to: 'reservations#index'
  get '/reservations/', to: 'reservations#new'
  get '/reservations/confirm', to: 'reservations#confirm', as: 'confirm_reservation'
  post '/reservations/confirm', to: 'reservations#confirm'
  get 'rooms/search' ,to: 'rooms#search'
  post 'house', to: 'house#index'
  post 'rooms', to: 'rooms#search'
  post '/rooms/search', to: 'rooms#search'
  post 'reservations', to: 'reservations#confirm'
  post 'rooms', to:'rooms#create'
  post 'reservations', to: 'reservations#create'
  post 'rooms', to: 'rooms#create'
  resources :reservations


  resources :house, :only => :index 

  resources :reservations do
    post :confirm, on: :collection
  end
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


