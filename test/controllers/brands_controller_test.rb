require 'test_helper'

class BrandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brand = brands(:one)
  end

  test "should get index" do
    get brands_url, as: :json, headers: authenticated_header
    assert_response :success
  end

  test "should create brand" do
    assert_difference('Brand.count') do
      post brands_url,
        params: { name: Faker::Company.unique.name },
        as: :json, headers: authenticated_header
    end

    assert_response :created
  end

  test "should show brand" do
    get brand_url(@brand), as: :json, headers: authenticated_header
    assert_response :success
  end

  test "should update brand" do
    patch brand_url(@brand), params: { brand: {  } }, as: :json, headers: authenticated_header
    assert_response :success
  end

  test "should destroy brand" do
    assert_difference('Brand.count', -1) do
      delete brand_url(@brand), as: :json, headers: authenticated_header
    end

    assert_response :no_content
  end
end
