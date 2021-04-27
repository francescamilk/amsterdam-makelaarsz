Rails.application.routes.draw do
  resources :posts
  root to: 'public#main'

  resources :properties
  devise_for :accounts
  
  get '/properties-sale', to: 'properties#for_sale', as: 'for_sale'
  get '/properties-rent', to: 'properties#for_rent', as: 'for_rent'
  get '/account/properties', to: 'properties#agent_properties'
  post '/agent/message', to: 'properties#email_agent', as: 'email_agent'

  get '/dashboard', to: 'dashboard#index'
  get '/profile/:id', to: 'dashboard#profile', as: 'profile'

  get '/accounts', to: 'admin#accounts', as: 'accounts'
  get '/all-posts', to: 'admin#posts_index', as: 'admin_posts'

  get '/contacts', to: 'public#contacts', as: 'contacts'
end
