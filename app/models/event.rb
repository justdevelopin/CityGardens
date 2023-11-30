class Event < ApplicationRecord
  belongs_to :garden
  has_many :bookings
  has_one_attached :photo
end
