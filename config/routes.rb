Rails.application.routes.draw do

  root to: 'products#index'

  resources :about, only: [:index]

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/register' => 'users#new'
  post '/users' => 'users#create'

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :sales, only: [:index, :new, :create]
    resources :categories, only: [:index, :new, :create]
  end

end
