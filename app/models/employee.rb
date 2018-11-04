class Employee < ApplicationRecord
  enum position: {CEO: 0, Guide: 1, Driver: 2}
  validates :name, presence: true
  validates :position, presence: true
  validates :address presence: true
  validates :phone_number, presence: true
  has_many :tour_details
  has_many :tours, through: :tour_details
end
