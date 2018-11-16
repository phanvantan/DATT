class Tour < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  has_many :tour_details
  has_many :employees, through: :tour_details
  has_many :places, through: :tour_details
end
