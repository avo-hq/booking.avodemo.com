class Avo::Resources::Booking < Avo::BaseResource
  self.title = :id
  self.includes = []

  def fields
    field :id, as: :id
    field :user, as: :belongs_to
    field :room, as: :belongs_to
    field :booked_at, as: :date_time
    field :booked_for, as: :select, options: {
      '2 hours' => 2,
      '4 hours' => 4,
      '6 hours' => 6,
      '8 hours' => 8,
    }
  end
end