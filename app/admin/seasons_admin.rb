Trestle.resource(:seasons) do
  menu do
    group :projects, priority: 2 do
      item :seasons, icon: "fab fa-pagelines", priority: 1
    end
  end

  table do
    column :activity, link: false
    column :starts_on, align: :center do |season|
      l(season.starts_on, format: '%b %Y')
    end
    actions
  end

  form do |season|
    select :activity_id, Activity.order(:name), label: t('activerecord.models.activity.one').capitalize
    date_field :starts_on
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:season).permit(:name, ...)
  # end
end
