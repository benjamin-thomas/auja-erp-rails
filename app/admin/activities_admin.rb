Trestle.resource(:activities) do
  menu do
    group :configuration, priority: 2 do
      item :activities, icon: "fas fa-project-diagram" if current_user.id == 1
    end
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :name
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |activity|
    text_field :name
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:activity).permit(:name, ...)
  # end
end
