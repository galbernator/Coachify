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


  def is_site_admin?
    current_user.role.position == "Site Admin"
  end

  helper_method :is_site_admin?

  def is_owner?
    current_user.role.position == "Owner"
  end

  helper_method :is_owner?

  def is_company_admin?
    current_user.role.position == "Company Admin"
  end

  helper_method :is_company_admin?

  def is_regional_manager?
    current_user.role.position == "Regional Manager"
  end

  helper_method :is_regional_manager?

  def is_account_executive?
    current_user.role.position == "Account Executive"
  end

  helper_method :is_account_executive?

  def is_district_manager?
    current_user.role.position == "District Manager"
  end

  helper_method :is_district_manager?

  def is_store_manager?
    current_user.role.position == "Store Manager"
  end

  helper_method :is_store_manager?

  def is_employee?
    current_user.role.position == "Employee"
  end

  helper_method :is_employee?

  def is_manager_or_higher?
    current_user.role.id <= Role.find_by_position("Store Manager").id
  end

  helper_method :is_manager_or_higher?

  def is_DM_or_higher?
    current_user.role.id <= Role.find_by_position("District Manager").id
  end

  helper_method :is_DM_or_higher?

  def is_regional_or_higher?
    current_user.role.id <= Role.find_by_position("Regional Manager").id
  end

  helper_method :is_regional_or_higher?

  def is_company_admin_or_higher?
    current_user.role.id <= Role.find_by_position("Company Admin").id
  end

  helper_method :is_company_admin_or_higher?

end
