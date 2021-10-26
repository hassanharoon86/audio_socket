Rails.application.routes.draw do
  get 'artist/index'
  get 'manager/index'
  get 'home/index'

  root to: 'home#index'

  resources :artists
  resources :managers

  devise_for :users
end
