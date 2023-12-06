class Parcel < ApplicationRecord
  belongs_to :garden
  has_many :parcel_reservations
  has_one_attached :photo
  # validates :
end
