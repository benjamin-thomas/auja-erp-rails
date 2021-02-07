Trestle.resource(:members) do
  menu do
    group :contact, priority: 1 do
      item :members, icon: "fa fa-user"
    end
  end

  search do |query|
    query ? collection.search(query) : collection
  end


  table do
    column :id
    column :first_name
    column :last_name
    column :email
    column :family
  end

  # attrs - permitted params for the resource
  # params - full params hash
  build_instance do |attrs, params|
    Member.new(attrs).tap do |member|
      # http://rails-erp.auja.test:3000/admin/members/new?family_id=4
      if (family_id=params[:family_id])
        member.family_id = family_id
        member.last_name = Family.find(family_id).name
      end
    end
  end

  form do |member|
    if !member.persisted? || params[:verbose] == '1'
      select :family_id, Family.order(:name), label: t('activerecord.models.family.one').capitalize
    end

    row do
      col { text_field :first_name }
      col { text_field :last_name }
    end

    email_field :email
  end
end
