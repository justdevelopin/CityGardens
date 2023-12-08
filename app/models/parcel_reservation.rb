class ParcelReservation < ApplicationRecord
  belongs_to :parcel
  belongs_to :user
end
