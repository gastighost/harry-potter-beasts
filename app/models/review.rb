class Review < ApplicationRecord
  belongs_to :creature
  belongs_to :user

  validates :rating, :comment, presence: true
  validates :rating, inclusion: { in: 1..5 }
end
