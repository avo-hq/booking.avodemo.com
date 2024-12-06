# == Schema Information
#
# Table name: rooms
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :integer          not null
#
# Indexes
#
#  index_rooms_on_location_id  (location_id)
#  index_rooms_on_slug         (slug) UNIQUE
#
# Foreign Keys
#
#  location_id  (location_id => locations.id)
#
require "test_helper"

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
