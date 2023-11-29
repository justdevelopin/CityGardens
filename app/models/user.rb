class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :gardens, dependent: :destroy
  has_many :bookings
  has_many :events
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one_attached :photo

  validates :first_name, :last_name, presence: true
  validates :bio, presence: false
end
