class UserAuths::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    user = User.new
    user.set_status(:provisional)
    user.save

    super

    # 外部キー(user_id)の登録
    resource.user_id = user.id
    resource.save
  end

end