class Avo::Resources::Location < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.default_view_type = :grid

  self.find_record_method = -> {
    if id.is_a?(Array)
      query.where(slug: id)
    else
      query.friendly.find(id)
    end
  }

  self.search = {
    query: -> { query.ransack(id_eq: params[:q], name_cont: params[:q], description_cont: params[:q], m: "or").result(distinct: false) },
    item: -> do
      {
        title: record.name,
        description: record.description.truncate(72),
        image_url: record.photo.attached? ? main_app.url_for(record.photo.url) : nil
      }
    end
  }

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
    field :rooms, as: :has_many
  end

  # add fields here
end
