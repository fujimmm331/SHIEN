Rails.application.routes.draw do
  get 'notifications/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  } 

  root to: "teams#index"

  resources :notifications, only: :index
  resources :teams, only: [:index, :new, :create]
  resources :matters do
    resources :contact_logs, only: [:index,:create]
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
