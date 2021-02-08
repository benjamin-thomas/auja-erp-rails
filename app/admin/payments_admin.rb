Trestle.resource(:payments) do
  return_to do |payment|
    families_admin_path(payment.membership.family_id)
  end

  menu do
    group :projects do
      item :payments, icon: "far fa-money-bill-alt", priority: 2
    end
  end

  table do
    column :membership do |payment|
      m = payment.membership
      link_to("#{m.family} / #{m.season}", families_admin_path(m.family))
    end
    column :assigned_on
    column :assigned_on, align: :center
    actions
  end

  form do |payment|
    membership_id = payment.membership_id || params[:membership_id]
    payment.assigned_on ||= Date.today

    rel = Membership
            .where(id: membership_id)
            .map { |m|
              [
                [m.family, m.season].join(' / '),
                m.id
              ]
            }
    select :membership_id, rel, disabled: true
    hidden_field :membership_id, value: membership_id
    date_field :assigned_on
    select :payment_type_id, PaymentType.order(:name)
    number_field :amount, step: 0.01
    text_area :notes
  end

end
