Rails.application.routes.draw do
  #resources :categories
  root 'home#index' 
  get 'home/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #resources :reviews
  #resources :requests
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, 
                   path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  #root "application#index", as: :login 
  post '/products', to: 'products#create', as: :create_product

 # get '/user/registrations/:id', to: 'registrations#show', as: :registration
  get '/users/:id', to: 'chats#show', as: :user
  #get '/users/:id', to: 'users#show', as: :user
  get '/chats', to: 'chats#index'
  #post '/chats', to 'chats#create'
  #resources :chats, only: [:index, :new, :create]
  get '/chats', to: 'chats#index'
  get '/chats/new', to: 'chats#new', as: :new_chat
  post '/chats', to: 'chats#create'
  #get '/chats/:id', to: 'chats#show', as: :chat
  get 'chats/:id/inchat', to: 'chats#inchat', as: :inchat_chat
  #patch 'chats/update', to: 'chats#update', as: 'update_chat'
  patch '/chats/:id', to: 'chats#update', as: :update_chat



  
  #root "application#index", as: :login 
  #post '/products', to: 'products#create'
  get '/products/new', to: 'products#new', as: :new_product
  get '/products', to: 'products#index' 
  get '/products/:id', to: 'products#show', as: :product
  get '/products/:id/edit', to: 'products#edit', as: :edit_product
  patch '/products/:id', to: 'products#update', as: :update_product
  delete '/products/:id', to: 'products#destroy', as: :destroy_product

  get '/products/:products_id/requests/show/:id', to: 'requests#show', as: :show_requests
  get "/products/:products_id/requests/index", to: "requests#index", as: :index_request
  get "/products/:products_id/requests/new", to: "requests#new", as: :requests
  post '/products/:products_id/requests/new', to: "requests#create", as: :create_request
  patch '/products/:products_id/requests/:id', to: 'requests#update', as: :request
  delete '/products/:products_id/requests/:id', to: "requests#destroy", as: :destroy_request
  get '/products/:products_id/requests/edit/:id', to: 'requests#edit', as: :edit_request
  
  get "/products/:products_id/reviews", to: "reviews#index", as: :index_review
  get "/products/:products_id/reviews/new", to: "reviews#new", as: :reviews
  post '/products/:products_id/reviews/new', to: "reviews#create", as: :create_reviews
  patch '/products/:products_id/reviews/:id', to: 'reviews#update', as: :update_review
  get '/products/:products_id/reviews/edit/:id', to: 'reviews#edit', as: :edit_review
  delete '/products/:products_id/reviews/:id', to: "reviews#destroy", as: :destroy_reviews
  get '/products/:products_id/reviews/show/:id', to: 'reviews#show', as: :show_reviews
  


  get '/categories/new', to: 'categories#new', as: :new_category
  post '/categories/new', to: 'categories#create', as: :create_category


  get '/request/show', to: 'home#show', as: :show_all_request
  get '/request/aceptadas', to: 'home#aceptadas', as: :aceptadas_request
  get '/products/:products_id/reviews/update/:id', to: 'home#update', as: :aceptar_request


end

