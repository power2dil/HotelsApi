require "test_helper"

class Hotel::BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotel_booking = hotel_bookings(:one)
  end

  test "should get index" do
    get hotel_bookings_url, as: :json
    assert_response :success
  end

  test "should create hotel_booking" do
    assert_difference("Hotel::Booking.count") do
      post hotel_bookings_url, params: { hotel_booking: { end_date: @hotel_booking.end_date, property_id: @hotel_booking.property_id, start_date: @hotel_booking.start_date, status: @hotel_booking.status, user_id: @hotel_booking.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show hotel_booking" do
    get hotel_booking_url(@hotel_booking), as: :json
    assert_response :success
  end

  test "should update hotel_booking" do
    patch hotel_booking_url(@hotel_booking), params: { hotel_booking: { end_date: @hotel_booking.end_date, property_id: @hotel_booking.property_id, start_date: @hotel_booking.start_date, status: @hotel_booking.status, user_id: @hotel_booking.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy hotel_booking" do
    assert_difference("Hotel::Booking.count", -1) do
      delete hotel_booking_url(@hotel_booking), as: :json
    end

    assert_response :no_content
  end
end
