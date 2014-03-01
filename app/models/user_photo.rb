class UserPhoto < ActiveRecord::Base
  has_one :photo_image, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :photo_image, allow_destroy: true

  attr_accessor :temp_image
  attr_reader :uploaded_image

  IMAGE_TYPES = {
      "image/jpeg" => "jpg",
      "image/gif" => "gif",
      "image/png" => "png"
  }.freeze

  # content_type変換
  def convert_content_type(ctype)
    ctype = ctype.rstrip.downcase

    case ctype
      when "image/pjpeg" then "image/jpeg"
      when "image/jpg"  then "image/jpeg"
      when "image/x-png" then "image/png"
      else ctype
    end
  end

  def extension
    IMAGE_TYPES[content_type]
  end

  def uploaded_image=(image)
    self.content_type = convert_content_type(image.content_type)
    self.file_name = image.original_filename

    # DB登録対象外
    self.temp_image = image
  end

end
