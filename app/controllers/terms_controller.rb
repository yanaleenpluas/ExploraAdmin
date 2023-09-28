class TermsController < ApplicationController
  protect_from_forgery except: [:set_selected_term, :create]

  # Set the selected period in the session.
  #
  # A redirect to the next step in the course creation process is performed, in
  # this case that would be the page for choosing a term to work on.
  def set_selected_term
    session[:term] = params[:term]
    redirect_to admin_create_course_s1_path
  end

  # Create a new term.
  def create
    # TODO: Persist term in the database.
    # TODO: Create term in Canvas.
    puts term_params
    redirect_to admin_create_course_s1_path
  end

  private

  def term_params
    params.permit(
      :nombre,
      :fecha_inicio,
      :fecha_fin
    )
  end
end
