Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :artists
  resources :managers
  resources :auditions, only: [:new, :create, :show] do
    collection do
      get '/', to: 'auditions#new'
      get :update_status, to: 'auditions#update_status'
    end
  end

  get 'update_assigned_to', to: "auditions#update_assigned_to"
end
