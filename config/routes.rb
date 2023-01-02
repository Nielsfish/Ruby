Rails.application.routes.draw do
  root to: 'static#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :registers
  resources :vacations
  resources :employees
  resources :gates
  resources :positions
  resources :managers
  resources :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
