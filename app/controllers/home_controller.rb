class HomeController < ApplicationController
  def index
    if user_auth_signed_in?
      redirect_to controller:'users', action:'index'
    else
      redirect_to controller:'user_auths/registrations', action:'new'
    end
  end
end
