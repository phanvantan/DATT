module Count
  def tours_count
    Tour.select(:id).size
  end

  def places_count
    Place.select(:id).size
  end

  def employees_count
    Employee.select(:id).size
  end

  def users_count
    User.select(:id).size
  end

  def tour_bookings_count
    TourBoking.select(:id).size
  end
end
