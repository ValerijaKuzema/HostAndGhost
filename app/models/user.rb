class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true
  validates :death_date, presence: true, format: {with: /\d{0,2}\/\d{0,2}\/\d{4}/, message: 'not a valid date' }
  has_many :bookings
  has_many :places, through: :bookings
end
