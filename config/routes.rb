Rails.application.routes.draw do
  
  resources :movies do
    member { post 'checkout' }
    member { post 'checkin' }
    
  end
  
  root to: 'visitors#index'
  
  devise_for :users, :controllers => { registrations: 'registrations' }  
  resources :users  

end
