# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    h1 "Hola, #{current_admin_user.name} #{current_admin_user.last_name}"
    div do
      "Hola mis negros"
    end
  end
end
