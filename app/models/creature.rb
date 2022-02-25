class Creature < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, :category, :breed, :super_power, :needed_years_magic, presence: true

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_and_category_and_breed,
    against: [ :name, :category, :breed ],
    using: {
      tsearch: { prefix: true }
    }
end
