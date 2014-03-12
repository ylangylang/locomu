module UserPhotosHelper

  def user_image_link_tag(photo, options = {})
    if photo.photo_image.image.present?
      path = user_photo_path(photo, format:photo.extension)
      link_to(image_tag(
                  url_for(action: 'get_image', id: photo.id),
                  { alt: photo.tilte }.merge(options)
              ),
              photo
      )
    else
      ""
    end
  end

  def user_image_tag(photo, options = {})
    if photo.photo_image.image.present?
      image_tag(url_for(action: 'get_image', id: photo.id), options)
    else
      ""
    end
  end

  def user_thumb_tag(user_photo, options = {})
    if user_photo.photo_image.image.present?
      image_tag(url_for(action: 'get_thumb', id: user_photo.id), options)
    else
      ""
    end
  end

  def user_thumb_link_tag(user_photo, options = {})
    if user_photo.photo_image.image.present?
      image_tag(
          url_for(action: 'get_thumb', id: user_photo.id),
          { 'data-content'=> user_photo.comment }.merge(options)
      )
    else
      ""
    end
  end

  # @return [Object]
  def user_photo_download_tag(photo)
    if photo.photo_image.image.present?
      url_for(action: 'get_image', id: photo.id)
    else
      ""
    end
  end

end
