class Voiture < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # has_many :bookings, dependant: :destroy
end
