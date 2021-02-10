class Transaction < ApplicationRecord
  validates :cleared_on, presence: true
  validates :amount, presence: true
  validates :descr, presence: true

  has_many :cleared_payments
  has_many :payments, through: :cleared_payments

  has_one :view, class_name: 'TransactionView', foreign_key: 'id'

  def display_for_select
    [cleared_on.to_date, amount, descr[0..100]].join(' ::: ')
  end

  def self.balanced
    joins(:view).where(view: { balanced: true })
  end


  def self.unbalanced
    joins(:view).where(view: { balanced: false })
  end
end
