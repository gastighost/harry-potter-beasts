class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :creatures, dependent: :destroy
  has_many :reviews
  has_many :bookings

  validates :name, :hogwarts_house, :years_of_magic, presence: true
  validates :hogwarts_house, inclusion: { in: %w[gryffindor hufflepuff ravenclaw slytherin],
                                          message: "%{value} is not a house" }
end
