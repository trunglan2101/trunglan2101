Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  # get 'users/show'
  # get 'user/new'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  get '/signup' => 'users#new'
  # get 'user/:id' => 'user#show'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users
  resource :microposts, only: [:create, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
