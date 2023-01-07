Rails.application.routes.draw do
  root to: proc { [404, {}, ["404"]] }

  get '/api' => redirect('/swagger/dist/index.html?url=/api-docs.json')

  namespace 'v1' do
    root to: proc { [404, {}, ["404"]] }

    post '/login', to: 'sessions#login'

    resources :registers
    resources :vacations
    resources :employees
    resources :gates
    resources :positions
    resources :managers
    resources :users

    end
end
