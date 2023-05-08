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
  get '/reservations', to: 'reservations#new'
  get '/rooms', to: 'rooms#confirm', as: 'confirm'
  get '/confirm', to: 'confirm#index'
  post '/rooms/:id/confirm', to: 'rooms#confirm', as: 'confirm_room'
  post '/reservations/confirm', to: 'reservations#confirm', as: 'confirm_reservations'
  resources :reservations do
    member do
      post 'confirm' ,to: 'reservations#confirm'
    end
  end
  resources :reservation do
    collection do
      get :confirm
    end
  end
  resources :reservations do
    get 'show/id', to: 'rooms#show', as: 'show'
  end
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

