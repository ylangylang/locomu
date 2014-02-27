class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  include UserAuths

  ################################################################################################
  # protected
  ################################################################################################
  protected

  def current_user
    if user_auth_signed_in?
      user_auth = current_user_auth
      if @current_user.nil?
        @current_user = User.find(user_auth.user_id)
      else
        @current_user
      end
    else
      authenticate_user_auth!
    end
  rescue ActiveRecord::RecordNotFound
    # todo:処理検討
    redirect_to controller:'user_auths/registrations', action:'new'
  end

  # サインイン後の画面遷移
  def after_sign_in_path_for(resource)
    user = current_user
    if user.has_status?(:provisional)
      edit_profile_users_path
    else
      users_path
    end
  end

  # サインアウト後の画面遷移
  def after_sign_out_path_for(resource)
    new_user_auth_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :user_id
  end

  ################################################################################################
  # private
  ################################################################################################
  private

end
