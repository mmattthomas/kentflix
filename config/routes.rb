Rails.application.routes.draw do
  resources :movies
  root to: 'visitors#index'
  devise_for :users
  resources :users  
end
