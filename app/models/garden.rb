class Garden < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: ->(obj) { obj.location.present? }
  has_many_attached :photos

  # validates :photos, content_type: [:png]
end
