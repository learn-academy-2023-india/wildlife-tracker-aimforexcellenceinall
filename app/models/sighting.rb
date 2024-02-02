class Sighting < ApplicationRecord
  belongs_to :animal
  # Story 4:
  validates :latitude, :longitude, :date, presence: true
end
