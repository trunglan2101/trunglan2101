Rails.application.routes.draw do
  # get 'sessions/new'
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
  resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
