class PeriodController < ApplicationController
  protect_from_forgery except: [:set_selected_period]
  # Set the selected period in the session.
  #
  # A redirect to the next step in the course creation process is performed, in
  # this case that would be the page for choosing a term to work on.

  def set_selected_period
    session[:period] = params[:period]
    # TODO: Redirect to the next step (Alina's view)
    # redirect_to admin_jornada_path
    puts "Periodo seleccionado: #{session[:period]}"
  end

  def create
    @period = Period.new(period_params)
    @period.save
    redirect_to admin_period_path
  end
end