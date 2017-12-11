Rails.application.routes.draw do
  
  resources :comments
  resources :movies do
    member { post 'checkout' }
    member { post 'checkin' }
    
  end
  
  authenticated :user do
    root to: "movies#index", as: :authenticated_root
  end
  
  unauthenticated do
    root to: 'visitors#index'
  end

  devise_for :users, :controllers => { registrations: 'registrations' }  
  resources :users  

end
