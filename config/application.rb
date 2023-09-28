require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module ExploraAdmin
  class Application < Rails::Application
    config.load_defaults 7.0

    config.after_initialize do
      # To setup this, create a file config/initializers/canvas.rb with the
      # following contents:
      #
      # Rails.application.config.canvas_api_key = "..."
      # Rails.application.config.canvas_api_base = "..."
      #
      $access_token = config.canvas_api_key
      $api_base = config.canvas_api_base
    end
  end
end
