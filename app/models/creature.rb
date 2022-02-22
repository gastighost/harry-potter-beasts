class Creature < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings

  validates :category, :breed, :super_power, :needed_years_magic, presence: true
end
