class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize_user!
    redirect_to new_session_path, notice: "Please sign in" unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end

  helper_method :current_user


  def is_site_admin?(user)
    user.role_id == 1
  end

  helper_method :is_site_admin?

  def is_company_admin?(user)
    user.role_id == 2 || current_user.role_id == 3
  end

  helper_method :is_company_admin?

  def is_district_manager?(user)
    user.role_id == 4 || current_user.role_id == 5
  end

  helper_method :is_district_manager?

  def is_store_manager?(user)
    user.role_id == 6
  end

  helper_method :is_store_manager?

  def is_employee?(user)
    user.role_id == 7
  end

  helper_method :is_employee?

end
