require "application_system_test_case"

class TourBookingsTest < ApplicationSystemTestCase
  setup do
    @tour_booking = tour_bookings(:one)
  end

  test "visiting the index" do
    visit tour_bookings_url
    assert_selector "h1", text: "Tour Bookings"
  end

  test "creating a Tour booking" do
    visit tour_bookings_url
    click_on "New Tour Booking"

    fill_in "Name", with: @tour_booking.name
    fill_in "Price", with: @tour_booking.price
    fill_in "Status", with: @tour_booking.status
    fill_in "Time", with: @tour_booking.time
    fill_in "Tour Detail", with: @tour_booking.tour_detail_id
    click_on "Create Tour booking"

    assert_text "Tour booking was successfully created"
    click_on "Back"
  end

  test "updating a Tour booking" do
    visit tour_bookings_url
    click_on "Edit", match: :first

    fill_in "Name", with: @tour_booking.name
    fill_in "Price", with: @tour_booking.price
    fill_in "Status", with: @tour_booking.status
    fill_in "Time", with: @tour_booking.time
    fill_in "Tour Detail", with: @tour_booking.tour_detail_id
    click_on "Update Tour booking"

    assert_text "Tour booking was successfully updated"
    click_on "Back"
  end

  test "destroying a Tour booking" do
    visit tour_bookings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tour booking was successfully destroyed"
  end
end
