# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  booked_at  :datetime
#  booked_for :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_bookings_on_room_id  (room_id)
#  index_bookings_on_user_id  (user_id)
#
# Foreign Keys
#
#  room_id  (room_id => rooms.id)
#  user_id  (user_id => users.id)
#
class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user

  scope :in_the_future, -> { where("booked_at > ?", Time.current) }
end
