Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Creating new admin users.
  get "/register", to: "register#index"
  post "/register", to: "register#create"

  # Dashboard controller
  post(
    "/select_institution/:institution", 
    to: "dashboard#set_selected_institution"
  )
  # Period controller
  resources :periods  
  post(
    "/select_period/:period", 
    to: "period#set_selected_period")
  # Send the user to the dashboard by default.
  #
  # This will in turn redirect to the login page
  # if the user is not logged in.
  root "admin/dashboard#index"
  
end
