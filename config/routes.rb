Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root to: 'home#index'

  resources :artists
  resources :managers
  resources :charges, only: [:new, :create]

  resources :users do
    resource :artist_detail
  end
  resolve('ArtistDetail') { [:artist_detail] }

  resources :auditions, only: [:new, :create, :show] do
    collection do
      get '/', to: 'auditions#new'
    end
  end

  get 'update_status_and_send_invite', to: "auditions#update_status_and_send_invite"
  get 'update_assigned_to', to: "auditions#update_assigned_to"
  get 'show_email_modal', to: "auditions#show_email_modal"
end
