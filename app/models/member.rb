class Member < ApplicationRecord
  belongs_to :family

  def to_s
    [first_name, last_name].join(' ')
  end
end
