class ParcelReservation < ApplicationRecord
  belongs_to :parcel
  belongs_to :user

  has_one_attached :photo
end
