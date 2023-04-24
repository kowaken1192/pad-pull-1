Rails.application.routes.draw do
  get 'accounts/show'
  devise_for :users
  resources :posts
  root "posts#index"
  resources :users
  resource :account, only: [:edit, :update,:show]
  get '/account', to: 'accounts#show'
  get '/users', to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
