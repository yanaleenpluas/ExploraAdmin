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
    periodo = Periodo.new(term_params)

    logger.debug "Making request to create periodo in Canvas"
    response = Excon.post(
      "#{$api_base}/api/v1/accounts/2/terms",
      headers: {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{$access_token}"
      },
      body: {
        enrollment_term: {
          name: periodo.nombre,
          start_at: periodo.fecha_inicio,
          end_at: periodo.fecha_fin
        }
      }.to_json)

    if response.status != 200
      logger.error "Failed to create periodo in canvas"
      # TODO: Show an error in the UI.
      redirect_to admin_periodos_path
      return
    end

    new_term = JSON.parse(response.body, symbolize_names: true)
    logger.debug "Created new term in Canvas: #{new_term}"

    new_term_id = new_term[:id]
    periodo.canvas_term_id = new_term_id
    
    periodo.save

    if periodo.valid?
      logger.debug "Successfully persisted periodo in database: #{periodo.nombre}"
      redirect_to admin_create_course_s1_path
    else
      logger.error "Failed to persist new periodo in database"
      redirect_to admin_periodos_path
    end
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
