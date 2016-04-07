Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  #get    'edit_user'  , to: 'users#edit'
  #patch  'update' ,     to: 'users#update' 
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users do
    member do
      get 'followings','followers'
    end
  end
  
  resources :microposts
  resources :relationships, only: [:create, :destroy]
# resources :sessions, only: [:new, :create, :destroy]
end