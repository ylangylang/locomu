class HomeController < ApplicationController
  def index
    if user_auth_signed_in?
      #redirect_to controller:'devise/sessions', action:'new'
      redirect_to '/users/index'
    else
      redirect_to controller:'user_auths/registrations', action:'new' #, layout: false # , layout:false #layout:'user_auths'
    end
  end
end
