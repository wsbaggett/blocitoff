Rails.application.routes.draw do
  get 'items/new'

  get 'items/create'

  devise_for :users
  resources :users, only: [:show] do
    resources :items, only: [:create, :new]
  end
  get 'home/main'
  root 'users#show'
end
