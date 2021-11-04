Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :artists
  resources :managers
  resources :auditions, only: [:new, :create] do
    match 'auditions', to: 'auditions#new', via: [:get, :post]
  end

  get 'auditions', to: 'auditions#new'
end
