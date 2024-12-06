class Avo::Filters::FutureBookings < Avo::Filters::BooleanFilter
  self.name = "Future bookings"
  # self.visible = -> do
  #   true
  # end

  def apply(request, query, values)
    if values[:future].present?
      return query.where("booked_at > ?", Time.current)
    end

    query
  end

  def options
    {
      future: "Only future bookings"
    }
  end
end
