class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  protected
 
  def configure_permitted_parameters
    added_attrs = [:name, :phone, :email, :image, :type, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  def set_header(p_type, filename)
    case p_type
      when 'xls'
       headers['Content-Type'] = "application/vnd.ms-excel; charset=UTF-8'"
       headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
       headers['Cache-Control'] = ''
  
      when 'msword'
       headers['Content-Type'] = "application/vnd.ms-word; charset=UTF-8"
       headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
       headers['Cache-Control'] = ''
  
     end
   end
end
