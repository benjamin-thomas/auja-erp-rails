Trestle.resource(:members) do
  menu do
    item :members, icon: "fa fa-user"
  end

  table do
    column :id
    column :first_name
    column :last_name
    column :email
    column :family
  end

  form do |member|
    if !member.persisted? || params[:verbose] == '1'
      select :family_id, Family.order(:name)
    end

    row do
      col { text_field :first_name }
      col { text_field :last_name }
    end
  end
end
