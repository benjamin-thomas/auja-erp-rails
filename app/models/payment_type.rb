class PaymentType < ApplicationRecord
  def to_s
    name
  end
end
