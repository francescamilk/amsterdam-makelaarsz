Rails.application.routes.draw do
  get '/dashboard', to: 'dashboard#index'
  get '/dashboard/properties', to: 'dashboard#properties'
  get '/dashboard/report', to: 'dashboard#report'
  get "account/properties", to: "properties#my_properties"

  resources :properties
  devise_for :accounts

  root to: 'public#main'
end
