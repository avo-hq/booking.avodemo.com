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
class Room < ApplicationRecord
  has_one_attached :photo
  belongs_to :location
  has_many :bookings

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.ransackable_attributes(auth_object = nil)
    ["name", "description"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["location"]
  end
end
