class Place < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name,  presence: true, uniqueness: true
  validates :price, :description, :address, presence: true
end
