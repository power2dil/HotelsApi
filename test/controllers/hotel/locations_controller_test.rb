require "test_helper"

class Hotel::LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotel_location = hotel_locations(:one)
  end

  test "should get index" do
    get hotel_locations_url, as: :json
    assert_response :success
  end

  test "should create hotel_location" do
    assert_difference("Hotel::Location.count") do
      post hotel_locations_url, params: { hotel_location: { city: @hotel_location.city, country: @hotel_location.country, pincode: @hotel_location.pincode, state: @hotel_location.state } }, as: :json
    end

    assert_response :created
  end

  test "should show hotel_location" do
    get hotel_location_url(@hotel_location), as: :json
    assert_response :success
  end

  test "should update hotel_location" do
    patch hotel_location_url(@hotel_location), params: { hotel_location: { city: @hotel_location.city, country: @hotel_location.country, pincode: @hotel_location.pincode, state: @hotel_location.state } }, as: :json
    assert_response :success
  end

  test "should destroy hotel_location" do
    assert_difference("Hotel::Location.count", -1) do
      delete hotel_location_url(@hotel_location), as: :json
    end

    assert_response :no_content
  end
end
