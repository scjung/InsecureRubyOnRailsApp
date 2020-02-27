# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :posts
  resources :users
  resources :account_activations, only: [:edit]
  resources :articles do
    resources :comments
  end
end
