class Point < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_photo

  UPPER_LIMIT = 3.freeze

  validate do
  end

  def is_upper_limit?
    self.value >= UPPER_LIMIT
  end

  def add_point!
    if not is_upper_limit?
      self.value += 1
      self.save
    else
      return false
    end
  end

  def remove_point!
    if not self.value <= 0
      self.value -= 1
      self.save
    else
      return false
    end
  end

  class << self
    def get_value
    end
  end
end
