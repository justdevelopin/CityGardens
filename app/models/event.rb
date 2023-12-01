class Event < ApplicationRecord
  belongs_to :garden
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :max_attendees, presence: true
  validates :garden_id, presence: true
  validates :max_attendees, numericality: { greater_than: 0 }
  validate :date_cannot_be_in_the_past
end

def date_cannot_be_in_the_past
  errors.add(:date, "can't be in the past") if date.present? && date < Date.today
end
