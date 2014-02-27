json.array!(@user_photos) do |user_photo|
  json.extract! user_photo, :id, :user_id, :title, :content_type, :comment
  json.url user_photo_url(user_photo, format: :json)
end
