# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu false

  instituciones = [
    "Juan Vicente Maldonado",
    "Liceo Albonor",
    "Ciudad de Dios",
    "Cristobal Colón"
  ]

  class ExploraRectangle < Arbre::Component 
    builder_method :explora_rectangle
    
    def build(institucion, attributes = {})
      super(attributes)

      classes = attributes[:classes] || ""
      classes = "#{classes} rectangle"

      form method: "post" do
        button institucion, class: classes
      end
    end
  end

  content title: proc { I18n.t("active_admin.dashboard") } do
    div id: "dashboard" do
      h1 "Hola, #{current_admin_user.name} #{current_admin_user.last_name}"
      h2 "Escoge tu Institución"
      div id: "instituciones" do
        instituciones.each_with_index do |institucion, i|
          explora_rectangle(
            institucion,
            class: "institucion"
          )
        end
      end
    end
  end
end
