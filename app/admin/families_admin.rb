Trestle.resource(:families) do
  menu do
    item :families, icon: "fa fa-group"
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
  end

  form do |family|
    text_field :name
  end
end
