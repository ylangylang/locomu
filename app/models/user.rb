class User < ActiveRecord::Base
  has_one :user_auth, dependent: :destroy
  has_many :user_photo
  has_many :points
  has_many :pointed_photos, through: :points, source: :user_photo

  STATUS = {
      inactive: 0,      # インアクティブ
      active: 1,        # アクティブ
      provisional: 2,   # 仮登録
  }.freeze


  # フルネーム(姓＋名)
  def full_name
    self.last_name + self.first_name
  end

  def has_status?(val)
    (self.status == STATUS[val])
  end

  def set_status(val)
    self.status = STATUS[val]
  end

  def pointable_for?(user_photo)
    return (user_photo.user_id != self.id && !user_photo.point_upper_limit?(self.id))
  end

end
