class User < ActiveRecord::Base
  has_one :user_auth, dependent: :destroy

  # フルネーム(姓＋名)
  def full_name
    self.last_name.concat(self.first_name)
  end

end
