require "application_system_test_case"

class UserToursTest < ApplicationSystemTestCase
  setup do
    @user_tour = user_tours(:one)
  end

  test "visiting the index" do
    visit user_tours_url
    assert_selector "h1", text: "User Tours"
  end

  test "creating a User tour" do
    visit user_tours_url
    click_on "New User Tour"

    fill_in "Tour", with: @user_tour.tour_id
    fill_in "User", with: @user_tour.user_id
    click_on "Create User tour"

    assert_text "User tour was successfully created"
    click_on "Back"
  end

  test "updating a User tour" do
    visit user_tours_url
    click_on "Edit", match: :first

    fill_in "Tour", with: @user_tour.tour_id
    fill_in "User", with: @user_tour.user_id
    click_on "Update User tour"

    assert_text "User tour was successfully updated"
    click_on "Back"
  end

  test "destroying a User tour" do
    visit user_tours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User tour was successfully destroyed"
  end
end
