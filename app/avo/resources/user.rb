class Avo::Resources::User < Avo::BaseResource
  self.title = :full_name

  self.find_record_method = -> {
    if id.is_a?(Array)
      query.where(slug: id)
    else
      query.friendly.find(id)
    end
  }
  
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :email, as: :text
    field :username, as: :text
    field :full_name, as: :text
    field :admin, as: :boolean
    field :slug, as: :text
  end
end
