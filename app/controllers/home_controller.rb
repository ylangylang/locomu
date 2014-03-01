class HomeController < ApplicationController

  def index
    redirect_to controller:'user_auths/sessions', action:'new'
  end
end
