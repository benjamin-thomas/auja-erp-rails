class ClearedPayment < ApplicationRecord
  # Submitting transaction_id, then rails complains about tx not being filled
  # Not sure if it's related to Trestle for now.
  HACK_FIXES_BROKEN_FORM_SUBMIT = true

  belongs_to :payment
  belongs_to :tx,
             foreign_key: 'transaction_id',
             class_name: 'Transaction', optional: HACK_FIXES_BROKEN_FORM_SUBMIT # transaction is a ActiveRecord reserved keyword

  def display_for_li_item
    "Référencé par un paiement de #{number_to_currency(tx.amount)} en #{I18n.l(tx.cleared_on, format: '%B %Y')}"
  end

  private def number_to_currency(args)
    ApplicationController.helpers.number_to_currency(*args)
  end
end
