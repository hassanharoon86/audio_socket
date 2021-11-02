Rails.application.routes.draw do
  # get 'managers/index'
  devise_for :users

  resources :artists
  resources :managers, only: [:index]
  resources :auditions, only: [:new, :create, :update]

  root to: 'home#index'

  get 'update_assigned_to', to: "auditions#update_assigned_to", as: 'update_assigned_to'

  # get 'UPDATE_ASSIGNED_TO', action: :update, controller: 'auditions'
end
