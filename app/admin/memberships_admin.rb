Trestle.resource(:memberships) do
  menu do
    group :projects, priority: 2 do
      item :memberships, icon: "fas fa-book", priority: 2
    end
  end

  table do
    column :family
    column :season
    # column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |membership|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  form do |membership|
    if (family_id=params[:family_id])
      @family = Family.find(family_id)
      @seasons = Season.where.not(id: @family.memberships.select(:season_id))
    else
      @seasons = Season.order(starts_on: :desc)
    end
    select :family_id, Family.order(:name), label: t('activerecord.models.family.one').capitalize
    select :season_id, @seasons.order(starts_on: :desc), label: t('activerecord.models.season.one').capitalize
  end

  # attrs - permitted params for the resource
  # params - full params hash
  build_instance do |attrs, params|
    Membership.new(attrs).tap do |membership|
      # http://rails-erp.auja.test:3000/admin/members/new?family_id=4
      if (family_id=params[:family_id])
        membership.family_id = family_id
      end
    end
  end

end
