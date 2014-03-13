class ApplicationAuthController < ApplicationController
  before_action :authenticate_user_auth!

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


end