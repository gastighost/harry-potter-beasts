class Booking < ApplicationRecord
  belongs_to :creature
  belongs_to :user
end
