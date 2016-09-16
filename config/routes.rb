Rails.application.routes.draw do
  devise_for :users
  
  root 'pages#home'
  
  get 'about', to: 'pages#about'
  get 'servies', to: 'pages#services'
  get 'staff', to: 'pages#staff'
  get 'newsroom', to: 'pages#newsroom'
  get 'contact', to: 'pages#contact'
  
  resources :properties, except: [:show]

end
