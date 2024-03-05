require "test_helper"

class Hotel::PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotel_property = hotel_properties(:one)
  end

  test "should get index" do
    get hotel_properties_url, as: :json
    assert_response :success
  end

  test "should create hotel_property" do
    assert_difference("Hotel::Property.count") do
      post hotel_properties_url, params: { hotel_property: { location_id: @hotel_property.location_id, name: @hotel_property.name, rating_score: @hotel_property.rating_score, review_score: @hotel_property.review_score } }, as: :json
    end

    assert_response :created
  end

  test "should show hotel_property" do
    get hotel_property_url(@hotel_property), as: :json
    assert_response :success
  end

  test "should update hotel_property" do
    patch hotel_property_url(@hotel_property), params: { hotel_property: { location_id: @hotel_property.location_id, name: @hotel_property.name, rating_score: @hotel_property.rating_score, review_score: @hotel_property.review_score } }, as: :json
    assert_response :success
  end

  test "should destroy hotel_property" do
    assert_difference("Hotel::Property.count", -1) do
      delete hotel_property_url(@hotel_property), as: :json
    end

    assert_response :no_content
  end
end
