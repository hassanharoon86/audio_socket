Rails.application.routes.draw do
  # get 'managers/index'
  devise_for :users

  resources :artists
  resources :managers, only: [:index]
  resources :auditions, only: [:new, :create]

  root to: 'home#index'
end
