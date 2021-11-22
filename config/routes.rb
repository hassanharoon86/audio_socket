Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :artists
  resources :managers
  resources :auditions, only: [:new, :create] do
    collection do
      get '/', to: 'auditions#new'
    end
  end

  get 'update_assigned_to', to: 'auditions#update_assigned_to'
end
