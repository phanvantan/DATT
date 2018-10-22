require 'test_helper'

class TourBookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tour_booking = tour_bookings(:one)
  end

  test "should get index" do
    get tour_bookings_url
    assert_response :success
  end

  test "should get new" do
    get new_tour_booking_url
    assert_response :success
  end

  test "should create tour_booking" do
    assert_difference('TourBooking.count') do
      post tour_bookings_url, params: { tour_booking: { name: @tour_booking.name, price: @tour_booking.price, status: @tour_booking.status, time: @tour_booking.time, tour_detail_id: @tour_booking.tour_detail_id } }
    end

    assert_redirected_to tour_booking_url(TourBooking.last)
  end

  test "should show tour_booking" do
    get tour_booking_url(@tour_booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_tour_booking_url(@tour_booking)
    assert_response :success
  end

  test "should update tour_booking" do
    patch tour_booking_url(@tour_booking), params: { tour_booking: { name: @tour_booking.name, price: @tour_booking.price, status: @tour_booking.status, time: @tour_booking.time, tour_detail_id: @tour_booking.tour_detail_id } }
    assert_redirected_to tour_booking_url(@tour_booking)
  end

  test "should destroy tour_booking" do
    assert_difference('TourBooking.count', -1) do
      delete tour_booking_url(@tour_booking)
    end

    assert_redirected_to tour_bookings_url
  end
end
