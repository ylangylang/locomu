module UserAuths

  def current_user
    @current_user = User.find(current_user_auth.user_id) if @current_user.nil?
    @current_user
  rescue ActiveRecord::RecordNotFound
    authenticate_user_auth!
  end
end