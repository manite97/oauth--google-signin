Rails.application.routes.draw do
  root 'home#index'  

  get 'home/create', to: 'home#create'
  resources :users do
  	resources :orders
  end
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # get 'login', to: 'logins#new'
  get 'login/create', to: 'logins#create', as: :create_login
end


