class Garden < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :parcels, dependent: :destroy
  has_many :reviews
  geocoded_by :address
  after_validation :geocode, if: ->(obj) { obj.location.present? }
  has_many_attached :photos


  geocoded_by :location
  after_validation :geocode, if: ->(obj) { obj.location.present? }
  has_many_attached :photos
  # validates :photos, content_type: [:png]
end
