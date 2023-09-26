ActiveAdmin.register_page "Periodo" do

  periodos = [
    {id: 1, name: "Costa / Galápagos Verano 2023"},
    {id: 2, name: "Sierra / Amazonia Invierno 2023"},
    {id: 3, name: "Costa / Galápagos Invierno 2022"},
    {id: 4, name: "Sierra / Amazonía Verano 2022"},
    {id: 5, name: "Costa / Galápagos Verano 2022"}
  ]

  class PeriodRectangle < Arbre::Component 
    builder_method :period

    def build(period, attributes = {})
      super(attributes)

      classes = attributes[:classes] || ""
      classes = "#{classes} rectangle"

      form method: "post", action: "/select_period/#{period[:id]}" do
        button period[:name], class: classes
      end
    end
  end

  content title: proc { I18n.t("active_admin.periodo") } do
    div id: "period-view" do
      # TODO: Cambiar el nombre de la institución por el que se haya seleccionado en el paso anterior
      h1 session[:institution]
      h2 "Periodos académicos disponibles"

      div id: "periodos" do
        periodos.each do |periodo|
          period(
            periodo, 
            class: "periodo"
            )
        end
      end
    end
    div class: "container" do
      div id: "period-form" do
        h2 "Agregar nuevo periodo academico" 
        form method: "post", action: periods_path do

          div class: "field" do
            label "Nombre"
            input type: "text", name: "period[descripcion]"
          end

          div class: "field" do
            label "Fecha de inicio"
            input type: "date", name: "period[fecha_inicio]"
          end

          div class: "field" do
            label "Fecha de fin"
            input type: "date", name: "period[fecha_fin]"
          end

          div id: "actions" do
            input type: "submit", value: "Crear Nuevo Periodo", class: "action-button"
          end
        end
      end
      div id: "navigation" do
        button "Atras", class: "nav-button nav-button-before", onclick: "window.location.href = '/admin/dashboard'"
      end
    end
  end
end