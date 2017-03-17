Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  get 'home/main'
  root 'users#show'
end
