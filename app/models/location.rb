# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_locations_on_slug  (slug) UNIQUE
#
class Location < ApplicationRecord
  has_one_attached :photo
  has_many :rooms, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.ransackable_attributes(auth_object = nil)
    ["name", "description"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["rooms"]
  end
end
