Trestle.resource(:families) do
  menu do
    group :contact, priority: 1 do
      item :families, icon: "fa fa-group"
    end
  end

  search do |query|
    query ? collection.search(query) : collection
  end

  controller do
    def load_instance
      self.instance = Family
        .includes(:members)
        .order('members.first_name')
        .find(params.fetch(:id))
    end

    def join_season
      @family = Family.find(params.fetch(:id))
      if request.get?
        @seasons = Season.where.not(id: @family.memberships.select(:season_id))
      else
        membership = @family.memberships.build
        # fail params.require(:membership).fetch(:season_id).to_s
        membership.season_id = params.require(:membership).fetch(:season_id)
        if membership.save
          flash[:message] = flash_message("update.success", title: "Success!!", message: "The %{lowercase_model_name} was successfully updated.")
          redirect_to families_admin_path(@family)
        else
          #fail membership.errors.full_messages.to_s
          @seasons = Season.where.not(id: @family.memberships.select(:season_id))
          #flash.now[:danger] = 'oops'
          flash.now[:error] = flash_message("create.failure", title: "Warning!", message: "Please correct the errors below.")
          render :join_season,  status: :unprocessable_entity
        end
      end
    end
  end

  form do |family|
    text_field :name
  end

  table do
    column :name
    actions
  end

  routes do
    get :join_season, on: :member
    post :join_season, on: :member
  end
end
