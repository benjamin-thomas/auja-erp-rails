Trestle.resource(:transactions) do
  menu do
    group :accounting, priority: 3 do
      item :transactions, icon: "fas fa-lock", priority: 1 if current_user.id == 1
    end
  end

  form do
    date_field :cleared_on
    number_field :amount, step: 0.01
    text_area :descr
  end

end
