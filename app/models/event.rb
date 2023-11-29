class Event < ApplicationRecord
  belongs_to :garden
  has_many :bookings
  belongs_to :user
end
