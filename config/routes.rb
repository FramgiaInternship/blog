Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'

  get '/home', to: 'static_pages#home', as: 'home'

  get '/help', to: 'static_pages#help', as: 'help'

  get '/about', to: 'static_pages#about', as: 'about'

  get '/contact', to: 'static_pages#contact', as: 'contact'

  get '/signup', to: 'users#new', as: 'signup'

  resources :users do
    member do
      get :following, :followers
    end
  end
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get     '/login',     to: 'sessions#new'
  post    '/login',     to: 'sessions#create'
  delete  '/logout',    to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end