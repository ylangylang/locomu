class User < ActiveRecord::Base
  has_one :user_auth, dependent: :destroy
  has_many :user_photo

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

end
