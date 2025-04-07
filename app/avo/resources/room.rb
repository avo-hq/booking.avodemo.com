class Avo::Resources::Room < Avo::BaseResource
  self.title = :name
  self.default_view_type = :grid
  
  self.find_record_method = -> {
    if id.is_a?(Array)
      query.where(slug: id)
    else
      query.friendly.find(id)
    end
  }

  self.grid_view = {
    card: -> do
      {
        cover_url:
          if record.photo.attached?
            main_app.url_for(record.photo)
          end,
        title: record.name,
        body: record.description.truncate(50),
      }
    end
  }

  self.search = {
    query: -> { query.ransack(id_eq: params[:q], name_cont: params[:q], m: "or").result(distinct: false) },
    item: -> do
      {
        title: record.name,
        description: record.description.truncate(72),
        image_url: record.photo.attached? ? main_app.url_for(record.photo) : nil
      }
    end
  }

  def fields
    field :id, as: :id
    field :name, as: :text
    field :description, as: :textarea
    field :photo, as: :file, is_image: true
    field :location, as: :belongs_to
    field :bookings, as: :has_many, scope: -> { query.in_the_future }, name: "Future bookings"
  end
end