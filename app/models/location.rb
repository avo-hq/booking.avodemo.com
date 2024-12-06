class Location < ApplicationRecord
  has_one_attached :photo
  has_many :rooms, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged
end
