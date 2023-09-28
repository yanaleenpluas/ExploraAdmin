ActiveAdmin.register_page "Periodos" do
  menu if: Proc.new { session[:institution] }

  class Term < Arbre::Component
    builder_method :term

    def build(term, attributes = {})
      super(attributes)

      classes = attributes[:classes] || ""
      classes = "#{classes} rectangle"

      form method: "post", action: "/select_term/#{term.canvas_term_id}" do
        button term.nombre, class: classes
      end
    end
  end

  content title: "Periodos" do
    def save_missing_terms(terms)
      terms.reduce([]) do |periodos, term|
        periodo = Periodo.find_by(nombre: term[:nombre])
        if periodo
          periodos << periodo
          return periodos
        end

        logger.debug "Persisting periodo to the database: #{term[:nombre]}"
        new_periodo = Periodo.create(
          fecha_inicio: term[:fecha_inicio],
          fecha_fin: term[:fecha_fin],
          nombre: term[:nombre],
          canvas_term_id: term[:term_id])

        if new_periodo.valid?
          logger.debug "Successfully persisted periodo: #{new_periodo.nombre}"
          periodos << new_periodo
        else
          logger.error "Error while persisting periodo: #{term[:nombre]}"
        end

        periodos
      end
    end

    def get_terms
      # NOTE: This works under the assumption that the root account is always
      # id number 2, which is true.
      response = Excon.get(
        "#{$api_base}/api/v1/accounts/2/terms",
        headers: {"Authorization" => "Bearer #{$access_token}"})
      terms = JSON.parse(response.body, symbolize_names: true)[:enrollment_terms]
        .collect do |term|
        {
          fecha_inicio: term[:start_at],
          fecha_fin: term[:end_at],
          term_id: term[:id],
          nombre: term[:name]
        }
      end
      logger.debug "Got terms: #{terms}"

      logger.debug "Persisting missing terms"
      periodos = save_missing_terms terms

      periodos
    end

    h1 "Unidad Educativa #{session[:institution]}"
    tabs do
      tab "Periodos disponibles" do
        div id: "period-view" do
          h2 "Periodos académicos disponibles"
          div id: "periodos" do
            get_terms.each do |term|
              term(
                term, 
                class: "periodo"
              )
            end
          end
        end
      end
      tab "Nuevo periodo" do
        div class: "container" do
          div id: "period-form" do
            h2 "Crear un nuevo periodo académico" 
            form method: "post", action: terms_path do
              div class: "field" do
                label "Nombre", for: "nombre"
                input id: "nombre", type: "text", name: "nombre"
              end
              div class: "field" do
                label "Fecha de inicio", for: "fecha_inicio"
                input id: "fecha_inicio", type: "date", name: "fecha_inicio"
              end
              div class: "field" do
                label "Fecha de fin", for: "fecha_fin"
                input id: "fecha_fin", type: "date", name: "fecha_fin"
              end
              div class: "form-actions" do
                input(
                  type: "submit",
                  value: "Crear",
                  class: "action-button"
                )
              end
            end
          end
        end
    end

    navigation_buttons back: "/admin/dashboard"

    end
  end
end
