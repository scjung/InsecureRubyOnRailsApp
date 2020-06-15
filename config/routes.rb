# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
  resources :articles, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
  resources :attacks, only: %i[index show edit update]
  resources :csrf, only: %i[new index]
end
