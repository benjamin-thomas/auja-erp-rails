Trestle.resource(:payment_types) do
  menu do
    group :configuration do
      item :payment_types, icon: "fas fa-lock", priority: 4 if current_user.id == 1
    end
  end

  form do
    text_field :name
  end
end
