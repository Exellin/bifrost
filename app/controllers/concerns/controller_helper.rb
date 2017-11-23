module ControllerHelper
  def require_admin
    current_user.nil? ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end

  def set_navbar_variables
    @navbar_category = Category.where(name: 'navbar').first
  end
end
