module ApplicationHelper

  def current_user_full_name
    current_user = User.find(current_user_auth.user_id) if @current_user.nil?
    current_user.full_name
  end
end
