class Membership < ApplicationRecord
  belongs_to :family
  belongs_to :season

  has_many :payments

  def to_s
    [family, season].join(' / ')
  end
end
