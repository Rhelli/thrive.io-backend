Rails.application.routes.draw do
  resources :aggregate_personalities
  resources :individual_personalities
  resources :house_preferences
  resources :flatmate_preferences
  resources :properties
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/signin', to: 'auth#create'
      get '/profile', to: 'user#profile'
    end
  end
end
