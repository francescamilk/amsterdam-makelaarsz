Rails.application.routes.draw do
  root to: 'public#main'

  resources :properties
  devise_for :accounts
  
  get 'account/properties', to: 'properties#my_properties'
  get '/dashboard', to: 'dashboard#index'
  get '/profile/:id', to: 'dashboard#profile', as: 'profile'
end
