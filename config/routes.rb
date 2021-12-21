Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'users/show'
  # get 'user/new'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  get '/signup' => 'users#new'
  # get 'user/:id' => 'user#show'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
