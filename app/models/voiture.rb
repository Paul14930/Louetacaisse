class Voiture < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true
  # has_many :bookings, dependant: :destroy
  has_many :bookings, dependent: :destroy
end
