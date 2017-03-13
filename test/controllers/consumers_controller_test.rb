require 'test_helper'

class ConsumersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consumer = consumers(:one)
  end

  test "should get index" do
    get consumers_url, as: :json, headers: authenticated_header
    assert_response :success
  end

  test "should create consumer" do
    assert_difference('Consumer.count') do
      post consumers_url,
        params: { name: Faker::Name.unique.name },
        as: :json, headers: authenticated_header
    end

    assert_response :created
  end

  test "should show consumer" do
    get consumer_url(@consumer), as: :json, headers: authenticated_header
    assert_response :success
  end

  test "should update consumer" do
    patch consumer_url(@consumer),
      params: { consumer: { name: Faker::Name.unique.name } },
      as: :json, headers: authenticated_header
    assert_response :ok
  end

  test "should destroy consumer" do
    assert_difference('Consumer.count', -1) do
      delete consumer_url(@consumer), as: :json, headers: authenticated_header
    end

    assert_response :no_content
  end
end
