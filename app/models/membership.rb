class Membership < ApplicationRecord
  belongs_to :family
  belongs_to :season
end
