Rails.application.routes.draw do
  devise_for :users,
    controllers: {:registrations => "registrations"}
  resources :users, only: [:index]
  root 'home#index'
  #root 'documents#index'
  resources :documents
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
