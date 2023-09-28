class NavigationButtons < Arbre::Component
  builder_method :navigation_buttons

  def build(attributes = {})
    super(attributes)

    back = attributes[:back]
    forward = attributes[:forward]

    div class: "navigation-buttons" do
      if back 
        a "Atrás", href: back, class: "atras"
      end
      if forward
        # NOTE: For this to work the component needs to be
        # used inside a form with the appropriate action set.
        button "Siguiente", class: "siguiente"
      end
    end
  end
end
