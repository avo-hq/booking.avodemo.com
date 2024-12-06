class Room < ApplicationRecord
  belongs_to :location
  has_one_attached :photo  

  extend FriendlyId
  friendly_id :name, use: :slugged
end
