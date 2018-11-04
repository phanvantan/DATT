class Place < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  has_many :tour_details
  has_many :tours, through: :tour_details
  mount_uploader :picture, PictureUploader
end
