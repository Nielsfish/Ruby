Rails.application.routes.draw do
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
