class Review < ApplicationRecord
  belongs_to :creature
  belongs_to :user

  validates :rating, :comment, presence: true
  validates :rating, inclusion: { in: %w[1 2 3 4 5],
                                  message: "Please pick a number between 1 and 5" }
end
