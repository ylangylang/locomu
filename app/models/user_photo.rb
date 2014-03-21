class UserPhoto < ActiveRecord::Base
  has_one :photo_image, dependent: :destroy
  belongs_to :user
  has_many :points
  has_many :markers, through: :points, source: :user

  accepts_nested_attributes_for :photo_image, allow_destroy: true

  attr_accessor :temp_image
  attr_reader :uploaded_image
  #attr_accessible :user_ids

  validate :temp_image, persence: true
  validate :check_image

  IMAGE_TYPES = {
      "image/jpeg" => "jpg",
      "image/gif" => "gif",
      "image/png" => "png"
  }.freeze

  def check_image
    if not self.new_record?
      return
    end
    if temp_image.blank?
      errors.add(:uploaded_image, :blank)
      return
    end
    if temp_image.size > 10.megabytes
      errors.add(:uploaded_image, :too_big_image)
    end
    unless IMAGE_TYPES.has_key?(content_type)
      errors.add(:uploaded_image, :imvalid_image)
    end
  end

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

  def disp_title
    disp_title = (self.title.empty?) ? 'Untitled' : self.title
    disp_title
  end

  def summary
    summary = self.disp_title
    return (summary + ' by ' + User.find(user_id).full_name)
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

  def all_points
    self.points.sum('value')
  end

  def all_points_label(user_id)
    if self.point_upper_limit?(user_id)
      'max! ' + self.all_points.to_s
    else
      self.all_points.to_s
    end
  end

  def point_upper_limit?(user_id)
    point = self.points.where(user_id: user_id).first
    if point.present?
      point.is_upper_limit?
    else
      false
    end
  end

  class << self
    def search(query)
      rel = all
      if query.present?
        rel = rel.where("to_char(created_at, 'MM/DD/YYYY') = ?", "#{query}")
      end
      rel
    end
  end

end
