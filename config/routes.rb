Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Creating new admin users.
  get "/register", to: "register#index"
  post "/register", to: "register#create"

  # Defines the root path route ("/")
  root "register#index"
end
