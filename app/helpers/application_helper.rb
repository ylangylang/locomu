module ApplicationHelper

  # ログインユーザのフルネーム取得(姓名)
  def current_user_full_name
    if user_auth_signed_in?
      user_auth = current_user_auth
      User.find(user_auth.user_id).full_name
    else
      ""
    end
  end
end
