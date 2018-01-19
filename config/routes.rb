Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]}
  # devise_for :users, controllers: {
  #       sessions: 'users/sessions'
  #     }
  #   end
  root 'home#index'
  # as :user do
  #   get "/registrations", to: "registrations#new", as: "register"
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
