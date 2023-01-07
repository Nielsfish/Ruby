Rails.application.routes.draw do
  root to: proc { [404, {}, ["404"]] }

  get '/api' => redirect('/swagger/dist/index.html?url=/api-docs.json')

  namespace 'v1' do
    root to: proc { [404, {}, ["404"]] }

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'

    resources :registers
    resources :vacations
    resources :employees
    resources :gates
    resources :positions
    resources :managers
    resources :users

    end
end
