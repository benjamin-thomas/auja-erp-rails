Trestle.resource(:cleared_payments) do
  return_to do |cleared_payment|
    families_admin_path(cleared_payment.payment.membership.family_id)
  end

  menu do
    group :accounting do
      item :cleared_payments, icon: "fas fa-lock", priority: 2 if current_user.id == 1
    end
  end

  form do |cleared_payment|
    payment_id = cleared_payment.payment_id || params[:payment_id]

    tx_rel = Transaction
            .order(cleared_on: :desc)
            .map { |t| [t.display_for_select, t.id] }

    pm_rel = Payment
               .where(id: payment_id)
               .map { |p| [p.display_for_select, p.id] }

    select :payment_id, pm_rel, disabled: true
    hidden_field :payment_id, value: payment_id
    select :transaction_id, tx_rel
  end
end
