class Season < ApplicationRecord
  belongs_to :activity

  def to_s
    tail = I18n.l(starts_on, format: '%b %y')
    "#{activity.name} (#{tail})"
  end
end
