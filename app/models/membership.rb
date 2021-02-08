class Membership < ApplicationRecord
  belongs_to :family
  belongs_to :season

  has_many :payments
end
