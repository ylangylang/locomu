class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  include UserAuths

  ################################################################################################
  # protected
  ################################################################################################
  protected

  def current_user
    if user_auth_signed_in? && (not current_user_auth.nil?)
      @current_user = User.find(current_user_auth.user_id) if @current_user.nil?
      @current_user
    else
      authenticate_user_auth!
    end
  rescue ActiveRecord::RecordNotFound
    # todo:処理検討
    redirect_to controller:'user_auths/registrations', action:'new'
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :user_id
  end

  ################################################################################################
  # private
  ################################################################################################
  private

end
