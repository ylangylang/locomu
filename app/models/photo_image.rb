class PhotoImage < ActiveRecord::Base
  belongs_to :user_photo

  attr_reader :uploaded_image

  THUMB_SIZE = "550x700".freeze
  ICON_SIZE = "80x80".freeze


  def uploaded_image=(image)
    self.image = image.read
    self.image_size = self.image.size

    self.thumb = make_thumbnail(THUMB_SIZE)
    self.thumb_size = self.thumb.size

    self.icon = make_thumbnail(ICON_SIZE)
    self.icon_size = self.icon.size
  end

  def make_thumbnail(size)
    require 'mini_magick'

    thumb = MiniMagick::Image.read(self.image)
    thumb.resize(size)
    thumb.to_blob
  end

end
