class Avo::Resources::Room < Avo::BaseResource
  self.title = :name
  self.default_view_type = :grid

  self.grid_view = {
    card: -> do
      {
        cover_url:
          if record.photo.attached?
            main_app.url_for(record.photo.url)
          end,
        title: record.name,
        body: record.description.truncate(50),
      }
    end
  }

  def fields
    field :id, as: :id
    field :name, as: :text
    field :description, as: :textarea
    field :photo, as: :file, is_image: true
    field :location, as: :belongs_to
  end
end