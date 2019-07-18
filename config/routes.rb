Rails.application.routes.draw do
  resources :categories
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/lessons', to: 'static_pages#lessons'
  get    '/manage_lessons', to: 'static_pages#manage_lessons'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end
