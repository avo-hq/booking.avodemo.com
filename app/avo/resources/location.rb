class Avo::Resources::Location < Avo::BaseResource
  self.title = :name
  self.includes = []
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
    field :photo, as: :file, is_image: true, as_avatar: true
    field :rooms, as: :has_many
  end

  # add fields here
end