Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      get '/auto_login', to: 'auth#auto_login'
      post '/signin', to: 'auth#create'
      get '/profile', to: 'user#profile'
    end
  end
end
