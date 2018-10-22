require 'test_helper'

class UserToursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_tour = user_tours(:one)
  end

  test "should get index" do
    get user_tours_url
    assert_response :success
  end

  test "should get new" do
    get new_user_tour_url
    assert_response :success
  end

  test "should create user_tour" do
    assert_difference('UserTour.count') do
      post user_tours_url, params: { user_tour: { tour_id: @user_tour.tour_id, user_id: @user_tour.user_id } }
    end

    assert_redirected_to user_tour_url(UserTour.last)
  end

  test "should show user_tour" do
    get user_tour_url(@user_tour)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_tour_url(@user_tour)
    assert_response :success
  end

  test "should update user_tour" do
    patch user_tour_url(@user_tour), params: { user_tour: { tour_id: @user_tour.tour_id, user_id: @user_tour.user_id } }
    assert_redirected_to user_tour_url(@user_tour)
  end

  test "should destroy user_tour" do
    assert_difference('UserTour.count', -1) do
      delete user_tour_url(@user_tour)
    end

    assert_redirected_to user_tours_url
  end
end
