class Garden < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :parcels, dependent: :destroy
  #has_many :reviews, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: ->(obj) { obj.location.present? }
  has_many_attached :photos
  has_many :bookmarks, dependent: :destroy

  geocoded_by :location
  after_validation :geocode, if: ->(obj) { obj.location.present? }
  has_many_attached :photos

  def available_parcels
    self.parcels.reject { |parcel| parcel.parcel_reservations.any? }.count
  end
  def available_parcel_objects
    self.parcels.reject { |parcel| parcel.parcel_reservations.any? }
  end
end
