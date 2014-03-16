class Point < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_photo

  UPPER_LIMIT = 5.freeze

  validate do
  end

  def is_upper_limit?
    self.value >= UPPER_LIMIT
  end

  def add_point
    if not self.is_upper_limit?
      self.value += 1
    else
      return false
    end
  end

  def remove_point
    if not self.value <= 0
      @value -= 1
    else
      return false
    end
  end

  class << self
    def get_value
    end
  end
end
