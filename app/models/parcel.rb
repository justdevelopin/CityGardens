class Parcel < ApplicationRecord
  belongs_to :garden
  has_many :parcel_reservations

  # validates :
end
