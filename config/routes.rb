Rails.application.routes.draw do
  resources :registers
  resources :vacations
  resources :employees
  resources :gates
  resources :positions
  resources :managers
  resources :users
  root to: 'static#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
