Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      get '/flatmates', to: 'users#index'
      get '/auto-login', to: 'auth#auto_login'
      post '/signin', to: 'auth#create'
      get '/myaccount', to: 'user#profile'
      resources :properties, only: [:index]
      post '/new-property', to: 'properties#create'
      get '/property/:id', to: 'properties#show'
      post '/edit-property/:id', to: 'properties#update'
      post '/delete-property/:id', to: 'properties#destroy'
    end
  end
end
