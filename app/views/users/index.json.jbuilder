json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :nickname, :use_nickname, :birthday, :gender, :email_sub, :mail_notification, :admin, :status, :avatar
  json.url user_url(user, format: :json)
end
