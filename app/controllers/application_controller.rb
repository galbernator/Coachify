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
    user.role.id == 24
  end

  helper_method :is_site_admin?

  def is_owner?(user)
    user.role.id == 25
  end

  helper_method :is_owner?

  def is_company_admin?(user)
    user.role.position == "Company Admin"
  end

  helper_method :is_company_admin?

  def is_regional_manager?(user)
    user.role.position == "Regional Manager"
  end

  helper_method :is_regional_manager?

  def is_account_executive?(user)
    user.role.position == "Account Executive"
  end

  helper_method :is_account_executive?

  def is_district_manager?(user)
    user.role.position == "District Manager"
  end

  helper_method :is_district_manager?

  def is_store_manager?(user)
    user.role.position == "Store Manager"
  end

  helper_method :is_store_manager?

  def is_employee?(user)
    user.role.position == "Employee"
  end

  helper_method :is_employee?

end
