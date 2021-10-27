Rails.application.routes.draw do
  # get 'auditions/new'
  # get 'auditions/create'
  # get 'audition/new'
  # get 'audition/create'
  # get 'auditions/new'
  # get 'auditions/create'
  # get 'artist/index'
  # get 'manager/index'
  # get 'home/index'

  root to: 'home#index'

  resources :artists
  resources :managers
  resources :auditions, only: [:new, :create]

  devise_for :users
end
