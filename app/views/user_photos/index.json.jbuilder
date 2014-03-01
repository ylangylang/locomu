json.array!(@user_photos) do |user_photo|
  json.extract! user_photo, :id, :title, :image, :image_size, :thumb, :thumb_size, :content_type, :create_user_id, :comment
  json.url user_photo_url(user_photo, format: :json)
end
