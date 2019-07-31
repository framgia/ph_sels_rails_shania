Rails.application.routes.draw do
  get 'lessons/new'
  get 'answers/new'
  get 'categories/new'
  resources :categories
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users

  resources :words, only: [:index]

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :categories do
    resources :lessons do
      resources :answers
    end
  end

  resources :relationships,  only: [:create, :destroy]

  namespace :admin do 
    resources :categories do
      resources :words
    end
  end
end
