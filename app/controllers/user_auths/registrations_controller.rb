class UserAuths::RegistrationsController < Devise::RegistrationsController

  def create
    # Userの登録
    user = User.new
    user.set_status(:provisional)
    user.save

    build_resource(sign_up_params)
    # 外部キー(user_id)の登録
    resource.user_id = user.id

    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

end