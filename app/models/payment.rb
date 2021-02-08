class Payment < ApplicationRecord
  belongs_to :membership
  belongs_to :payment_type

  validates :assigned_on, presence: true
  validates :amount, presence: true
end
