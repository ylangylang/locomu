json.array!(@points) do |point|
  json.extract! point, :id, :user_id, :user_photo_id, :value, :color, :comment
  json.url point_url(point, format: :json)
end
