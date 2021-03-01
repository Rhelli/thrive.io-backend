Rails.application.routes.draw do
  resources :aggregate_personalities
  resources :individual_personalities
  resources :house_preferences
  resources :users
  resources :flatmate_preferences
  resources :properties
end
