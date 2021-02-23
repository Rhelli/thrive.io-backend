Rails.application.routes.draw do
  resources :aggregate_personalities
  resources :individual_personalities
  resources :house_preferences
  resources :users
  resources :flatmate_preferences
  resources :properties
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
