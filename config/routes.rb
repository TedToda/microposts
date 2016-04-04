Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  #get    'edit_user'  , to: 'users#edit'
  #patch  'update' ,     to: 'users#update' 
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users
<<<<<<< HEAD
  resources :microposts
=======
  resources :sessions, only: [:new, :create, :destroy]
>>>>>>> user-profile
end