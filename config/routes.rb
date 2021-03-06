Rails.application.routes.draw do
  resources :shortlists
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
      put '/edit-property/:id', to: 'properties#update'
      delete '/delete-property/:id', to: 'properties#destroy'
      delete '/delete-managed-properties', to: 'properties#multiple_destroy'
      get '/shortlisted_properties', to: 'shortlists#user_index'
      get '/property_likes', to: 'shortlists#property_index'
      post '/new-shortlist', to: 'shortlists#create'
      delete '/delete-shortlist', to: 'shortlists#destroy'
    end
  end
end
