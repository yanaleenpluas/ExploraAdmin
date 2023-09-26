class TermsController < ApplicationController
  protect_from_forgery except: [:set_selected_term, :create]

  # Set the selected period in the session.
  #
  # A redirect to the next step in the course creation process is performed, in
  # this case that would be the page for choosing a term to work on.
  def set_selected_term
    session[:term] = params[:term]

    # TODO: Redirect to the next step (Alina's view)
    # redirect_to admin_jornada_path
    puts "Periodo seleccionado: #{session[:term]}"
    redirect_to admin_periodos_path
  end

  # Create a new term.
  def create
    puts term_params
    redirect_to admin_periodos_path
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
