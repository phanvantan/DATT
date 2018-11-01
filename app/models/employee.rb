class Employee < ApplicationRecord
  enum position: {CEO: 0, Guide: 1, Driver: 2}
end
