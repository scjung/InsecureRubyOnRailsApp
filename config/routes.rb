Rails.application.routes.draw do
  get 'welcome/index'

  resources :posts
  resources :users
  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
