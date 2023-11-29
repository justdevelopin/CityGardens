class Garden < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: ->(obj) { obj.location.present? }
end
