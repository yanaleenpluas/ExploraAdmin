ActiveAdmin.register_page "Create course S1" do
  menu false

  content title: "Crear curso" do
    div id: "course-S1" do
      div id: "tipo-institucion" do
        h2 "Escoja el tipo de institución"
        div class: "radio-option" do
          input type: "radio", id: "escuela", name: "tipo-institucion", value: "Escuela"
          label "Escuela", for: "escuela"
        end
        div class: "radio-option" do 
          input type: "radio", id: "colegio", name: "tipo-institucion", value: "Colegio"
          label "Colegio", for: "colegio"
        end
      end
      div id: "tipo-jornada" do
        h2 "Escoja la jornada"
        div class: "radio-option" do
          input type: "radio", id: "matutino", name: "jornada", value: "Matutino"
          label "Matutino" , for: "matutino"
        end
        div class: "radio-option" do
          input type: "radio", id: "vespertino", name: "jornada", value: "Vespertino"
          label "Vespertino" , for: "vespertino"
        end
      end
    end

    # TODO: Redirigir a la pagina de Yanaleen.
    navigation_buttons(
      back: "/admin/periodos",
      forward:  "/admin/dashboard"
    )
  end
end
