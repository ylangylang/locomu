class HomeController < ApplicationController
  include UserAuths

  def index
    if not user_auth_signed_in?
      redirect_to controller:'user_auths/sessions', action:'new'
    end
  end
end
