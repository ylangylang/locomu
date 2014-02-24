class UserAuths::RegistrationsController < Devise::RegistrationsController

  def current_user
    @current_user = User.find(current_user_auth.user_id) if @current_user.nil?
    @current_user
  rescue ActiveRecord::RecordNotFound
    authenticate_user_auth!
  end

  def new
    super
  end

  def create
    user = User.new
    user.status = 2
    user.save

#    self.resource = user.id

    # todo:削除
#    user_id = params[:user_id]

    sign_up_params[:user_id] = user.id
    super

#    respond_with self.resource
  end

end