ActiveAdmin.register_page "Periodos" do
  menu if: Proc.new { session[:institution] }

  terms = [
    {id: 1, name: "Costa / Galápagos Verano 2023"},
    {id: 2, name: "Sierra / Amazonia Invierno 2023"},
    {id: 3, name: "Costa / Galápagos Invierno 2022"},
    {id: 4, name: "Sierra / Amazonía Verano 2022"},
    {id: 5, name: "Costa / Galápagos Verano 2022"}
  ]

  class Term < Arbre::Component
    builder_method :term

    def build(period, attributes = {})
      super(attributes)

      classes = attributes[:classes] || ""
      classes = "#{classes} rectangle"

      form method: "post", action: "/select_term/#{period[:id]}" do
        button period[:name], class: classes
      end
    end
  end

  content title: "Periodos" do
    h1 "Unidad Educativa #{session[:institution]}"
    tabs do
      tab "Periodos disponibles" do
        div id: "period-view" do
          h2 "Periodos académicos disponibles"
          div id: "periodos" do
            terms.each do |term|
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
