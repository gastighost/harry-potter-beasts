class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :creatures, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  before_validation { self.hogwarts_house = hogwarts_house.downcase }
  validates :name, :hogwarts_house, :years_of_magic, presence: true
  validates :hogwarts_house, inclusion: { in: %w[gryffindor hufflepuff ravenclaw slytherin],
                                          message: "%{value} is not a house" }
end
