Rails.application.routes.draw do
  resources :reserves
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
  
  get '/rooms/search', to: 'rooms#search', as: 'room_search'

  resources :house, only: :index
  
  get '/reserves/confirm', to: 'reserves#confirm', as: 'confirm_reserve'
  post '/reserves/confirm', to: 'reserves#confirm'
  get '/reserves/confirm', to: 'reserves#index'
  get '/house/index', to: 'house#index'

  resources :reserves, only: [:index, :new, :create, :show] do
    collection do
      post 'confirm'
    end
  end
  resources :rooms do
    member do
      get 'search'
    end
  end
end
