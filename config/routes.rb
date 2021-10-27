Rails.application.routes.draw do
  root to: 'home#index'

  resources :artists
  resources :managers
  resources :auditions, only: [:new, :create]

  devise_for :users
end
