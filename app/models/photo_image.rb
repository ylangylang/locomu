class PhotoImage < ActiveRecord::Base
  belongs_to :user_photo

  attr_reader :uploaded_image

  THUMB_SIZE = "400x400".freeze
  ICON_SIZE = "80x80".freeze


  def uploaded_image=(image)
    self.image = image.read
    self.image_size = self.image.size

    self.thumb = make_thumbnail(THUMB_SIZE)
    self.thumb_size = self.thumb.size

    self.icon = make_thumbnail(ICON_SIZE)
    self.icon_size = self.icon.size
  end

  ################################################################################################
  # private
  ################################################################################################
  private

  def make_thumbnail(size)
    require 'mini_magick'

    thumb = MiniMagick::Image.read(self.image)
    thumb = shave_image(thumb)
    thumb.resize(size)
    thumb.to_blob
  end

  def shave_image(target)
    image = MiniMagick::Image.read(target)
    if image[:width] < image[:height]
      remove = ((image[:height] - image[:width])/2).round
      image.shave("0x#{remove}")
    elsif image[:width] > image[:height]
      remove = ((image[:width] - image[:height])/2).round
      image.shave("#{remove}x0")
    end
    return image
  end

end
