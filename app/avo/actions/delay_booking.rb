class Avo::Actions::DelayBooking < Avo::BaseAction
  self.name = "Delay Booking"
  # self.visible = -> do
  #   true
  # end

  def fields
    field :number_of_hours, as: :number, default: 1, help: "Set the number of hours to delay the booking by"
  end

  def handle(query:, fields:, current_user:, resource:, **args)
    number_of_hours = fields["number_of_hours"] || 2

    query.each do |record|
      record.booked_at = record.booked_at + number_of_hours.to_i.hours
      record.save
    end
  end
end
