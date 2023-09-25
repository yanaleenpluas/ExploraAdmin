class DashboardController < ApplicationController
  protect_from_forgery except: [:set_selected_institution]

  def set_selected_institution 
    institution = params[:institution]
    session[:institution] = institution
    # TODO: Redirect to la pagina de washington.
    redirect_to admin_dashboard_path
  end
end
