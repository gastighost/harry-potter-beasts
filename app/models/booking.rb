class Booking < ApplicationRecord
  belongs_to :creature
  belongs_to :user

  validates :start_day, :end_day, presence: true
  validates_datetime :end_day, after: :start_day
end
