class Transaction < ApplicationRecord
  validates :cleared_on, presence: true
  validates :amount, presence: true
  validates :descr, presence: true

  def display_for_select
    [cleared_on.to_date, amount, descr[0..100]].join(' ::: ')
  end
end
