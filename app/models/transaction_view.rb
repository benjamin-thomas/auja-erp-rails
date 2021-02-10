class TransactionView < ApplicationRecord
  self.table_name = 'transaction_view'
  self.primary_key = 'id'
  belongs_to :tx, class_name: 'Transaction', foreign_key: 'id'

  def readonly?
    true
  end
end
