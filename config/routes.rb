Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  } 

  root to: "teams#index"

  resources :notifications, only: :index
  get 'notifications/:id', to: 'notifications#checked'

  resources :teams, only: [:index, :new, :create]
  resources :customers do
    resources :contact_logs, only: [:index,:create]
    collection do
      get 'search'
      get 'chosed_csv_export'
    end
  end
  resources :car, only: [:new, :create, :show, :edit, :update, :destroy]

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
