ActiveAdmin.register_page "Create course S1" do
  menu false

  content title: proc { I18n.t("active_admin.create_course_s1") } do
    div id: "course-S1" do
      div id: "tipo-institucion" do
        h2 "Escoja el tipo de institución"
        div class: "radio-option" do
          label do 
            input type: "radio", name: "tipo-institucion"
            span "Escuela"  
          end
        end
        div class: "radio-option" do 
          label do
            input type: "radio", name: "tipo-institucion"
            span "Colegio"
          end
        end

        h2 "Escoja la jornada"
        div class: "radio-option" do
          label do
            input type: "radio", name: "jornada"
            span "Matutino" 
          end
        end
        div class: "radio-option" do
          label do
            input type: "radio", name: "jornada"
            span "Vespertino" 
          end
        end
      end
    end
    div class: "buttons" do
        navigation_buttons back: "/admin/periodos"
        navigation_buttons forward: "/admin/dashboard"
    end
  end
end
