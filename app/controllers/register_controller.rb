class RegisterController < ApplicationController
  def index
    if current_admin_user
      redirect_to "/admin"
    end
  end

  def create
    admin_user = AdminUser.create(admin_user_params)
    if admin_user.valid?
      flash[:validation_errors] = false
      redirect_to "/admin"
    else
      flash[:validation_errors] = true
      redirect_to "/register"
    end
  end

  private 

  def admin_user_params
    params.permit(
      :name,
      :last_name,
      :email,
      :password
    )
  end
end
