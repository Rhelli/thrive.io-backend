Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      get '/flatmates', to: 'users#index'
      get '/auto-login', to: 'auth#auto_login'
      post '/authenticate', to: 'auth#check_credentials'
      post '/signin', to: 'auth#create'
      get '/myaccount', to: 'users#profile'
      put '/myaccount/settings/edit-profile', to: 'users#update'
      delete '/myaccount/settings/delete-profile', to: 'users#destroy'
      resources :properties, only: [:index]
      post '/new-property', to: 'properties#create'
      get '/property/:id', to: 'properties#show'
      get '/manage-properties', to: 'properties#advertiser_index'
      post '/edit-property/:id', to: 'properties#update'
      delete '/delete-property/:id', to: 'properties#destroy'
    end
  end
end
