class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pagy::Backend
  protect_from_forgery with: :exception
 
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action { pagy_headers_merge(@pagy) if @pagy }
  protected
 
  def configure_permitted_parameters
    added_attrs = [:name, :phone, :email, :image, :type, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
