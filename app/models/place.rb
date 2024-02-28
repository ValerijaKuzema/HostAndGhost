class Place < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_one_attached :photo
  validates :title, presence: true, uniqueness: true
  validates :price, :description, :address, presence: true
end
