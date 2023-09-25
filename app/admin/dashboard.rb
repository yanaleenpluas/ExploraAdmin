# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu false

  instituciones = [
    "Juan Vicente Maldonado",
    "Liceo Albonor",
    "Ciudad de Dios",
    "Cristobal Colón",
    "El Zapatito"
  ]

  class Institution < Arbre::Component 
    builder_method :institution
    
    def build(institution, attributes = {})
      super(attributes)

      classes = attributes[:classes] || ""
      classes = "#{classes} rectangle"

      form method: "post", action: "/select_institution/#{institution}" do
        button institution, class: classes
      end
    end
  end

  content title: proc { I18n.t("active_admin.dashboard") } do
    div id: "dashboard" do
      h1 "Hola, #{current_admin_user.name} #{current_admin_user.last_name}"
      h2 "Escoge tu Institución"
      div id: "instituciones" do
        instituciones.each do |institucion|
          institution(
            institucion,
            class: "institucion"
          )
        end
      end
    end
  end
end
