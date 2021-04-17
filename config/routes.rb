Rails.application.routes.draw do
  root to: 'public#main'

  resources :properties
  devise_for :accounts
  
  get '/properties/sale', to: 'properties#for_sale', as: 'for_sale'
  get '/properties/rent', to: 'properties#for_rent', as: 'for_rent'
  get '/account/properties', to: 'properties#my_properties'
  post '/agent/message', to: 'properties#email_agent', as: 'email_agent'

  get '/dashboard', to: 'dashboard#index'
  get '/profile/:id', to: 'dashboard#profile', as: 'profile'

  get '/accounts', to: 'admin#accounts', as: 'accounts'
end
