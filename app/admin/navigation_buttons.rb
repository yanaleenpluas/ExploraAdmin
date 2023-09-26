class NavigationButtons < Arbre::Component
  builder_method :navigation_buttons

  def build(attributes = {})
    super(attributes)

    back = attributes[:back]
    forward = attributes[:forward]

    # TODO: Set up the correct paths.

    div class: "navigation-buttons" do
      if back 
        form method: "get", action: back do
          button "Atras", class: "atras"
        end
      end
      if forward
        form method: "post", action: forward do
          button "Siguiente", class: "siguiente"
        end
      end
    end
  end
end
