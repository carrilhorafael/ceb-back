require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url, as: :json
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { close_at: @restaurant.close_at, name: @restaurant.name, open_at: @restaurant.open_at, owner_id: @restaurant.owner_id } }, as: :json
    end

    assert_response 201
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant), as: :json
    assert_response :success
  end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: { restaurant: { close_at: @restaurant.close_at, name: @restaurant.name, open_at: @restaurant.open_at, owner_id: @restaurant.owner_id } }, as: :json
    assert_response 200
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete restaurant_url(@restaurant), as: :json
    end

    assert_response 204
  end
end
