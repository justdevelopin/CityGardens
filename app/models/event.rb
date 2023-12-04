class Event < ApplicationRecord
  belongs_to :garden
  has_many :bookings
  has_many :attendees, through: :bookings, source: "user"
  has_one_attached :photo
end
