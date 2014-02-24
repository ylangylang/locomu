class HomeController < ApplicationController
  def index
    if user_auth_signed_in?
      if current_user.has_status?(:provisional)
        redirect_to edit_profile_users_url
        #redirect_to controller:'users', action:'edit_profile'
      else
        redirect_to controller:'users', action:'index'
      end
    else
      redirect_to controller:'user_auths/registrations', action:'new'
    end
  end
end
