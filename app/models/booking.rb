class Booking < ApplicationRecord
  belongs_to :creature
  belongs_to :user

  validates :start_day, :end_day, presence: true
  validates :end_day, comparison: { greater_than: :start_day }
end
