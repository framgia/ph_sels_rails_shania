Rails.application.routes.draw do
  get 'word/name'
  get 'categories/new'
  resources :categories
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/lessons', to: 'categories#index'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users

  namespace :admin do 
    resources :categories do
      resources :words, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end
end
