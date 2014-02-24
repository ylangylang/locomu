class User < ActiveRecord::Base
  has_one :user_auth, dependent: :destroy
end
