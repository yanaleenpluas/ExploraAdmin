# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu false

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
    def get_admin_account_id
      response = Excon.get(
        "#{$api_base}/api/v1/accounts",
        headers: { "Authorization" => "Bearer #{$access_token}" })
      accounts = JSON.parse(response.body, symbolize_names: true)
      admin_account_id = accounts[0][:id]
      admin_account_id
    end

    def get_subaccounts(account_id)
      response = Excon.get(
        "#{$api_base}/api/v1/accounts/#{account_id}/sub_accounts",
        headers: { "Authorization" => "Bearer #{$access_token}" })
      subaccounts = JSON.parse(response.body, symbolize_names: true)
      subaccounts
    end

    def get_account_admins(account_id)
      response = Excon.get(
        "#{$api_base}/api/v1/accounts/#{account_id}/admins",
        headers: {"Authorization" => "Bearer #{$access_token}"})
      admins = JSON.parse(response.body, symbolize_names: true)
      admins = admins.collect do |admin|
        {
          account_id: admin[:id],
          user_id: admin[:user][:id],
          email: admin[:user][:login_id]
        }
      end
      admins
    end

    def get_instituciones
      admin_account_id = get_admin_account_id
      logger.debug "Got admin account: #{admin_account_id}"

      subaccounts = get_subaccounts(admin_account_id).collect do |account|
        {account_name: account[:name], account_id: account[:id]}
      end
      logger.debug "Got current admin subaccounts #{subaccounts}"

      logger.debug "Fetching subaccounts for admin: #{current_admin_user.email}"

      subaccounts_for_current_admin = subaccounts.reduce([]) do |accounts, account|
        admins = get_account_admins(account[:account_id])
        logger.debug "Got admins for account #{account[:account_name]}: #{admins}"

        if admins.any? { |admin| admin[:email] == current_admin_user.email }
          accounts << account
        end

        accounts
      end

      instituciones = subaccounts_for_current_admin.collect do |account|
        account[:account_name]
      end

      instituciones
    end

    div id: "dashboard" do
      h1 "Hola, #{current_admin_user.name} #{current_admin_user.last_name}"
      h2 "Escoge tu Institución"
      div id: "instituciones" do
        get_instituciones.each do |institucion|
          institution(
            institucion,
            class: "institucion"
          )
        end
      end
    end
  end
end
