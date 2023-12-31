class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :bookings, :voitures
  has_many :bookings, dependent: :destroy
  has_many :voitures, through: :bookings
end
