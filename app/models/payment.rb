class Payment < ApplicationRecord
  belongs_to :membership
  belongs_to :payment_type

  has_many :cleared_payments

  validates :assigned_on, presence: true
  validates :amount, presence: true

  def display_for_select
    [
      assigned_on.to_date,
      amount,
      membership.family,
      membership.season
    ].join(' ::: ')
  end
end
