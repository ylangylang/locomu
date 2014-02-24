json.array!(@users) do |user|
  json.extract! user, :id, :nickname, :first_name, :last_name, :birthday, :gender, :mail_notification, :admin, :status, :avatar
  json.url user_url(user, format: :json)
end
