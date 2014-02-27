class ApplicationAuthController < ApplicationController
  before_action :authenticate_user_auth!

end