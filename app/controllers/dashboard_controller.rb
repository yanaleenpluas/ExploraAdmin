class DashboardController < ApplicationController
  protect_from_forgery except: [:set_selected_institution]

  # Sets the selected institution as session data to be used by other pages.
  #
  # A redirect to the next step in the course creation process is performed, in
  # this case that would be the page for choosing a term to work on.
  def set_selected_institution 
    institution = params[:institution]
    session[:institution] = institution

    # TODO: Redirect to la pagina de washington.
    redirect_to admin_dashboard_path
  end
end
