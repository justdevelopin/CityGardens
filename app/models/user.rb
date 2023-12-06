class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :gardens, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :events, through: :gardens
  has_many :parcels
  has_many :parcel_reservations

  has_many :attending_events, through: :bookings, source: :event

  # has_many :events, through: :gardens
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one_attached :photo

  validates :first_name, :last_name, presence: true
  validates :bio, presence: false
end
