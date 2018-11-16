class TourDetail < ApplicationRecord
  validates :start_day, presence: true
  validates :end_day, presence: true
  belongs_to :tour
  belongs_to :employee
  belongs_to :place
end
