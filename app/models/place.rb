class Place < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :users, through: :bookings
  validates :title, presence: true, uniqueness: true
  validates :price, :description, :address, presence: true
end
