require 'test_helper'

class HooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hook = hooks(:one)
  end

  test "should get index" do
    get hooks_url, as: :json, headers: authenticated_header
    assert_response :success
  end

  test "should create hook" do
    assert_difference('Hook.count') do
      post hooks_url, params: { hook: { callback: @hook.callback, threshold: @hook.threshold } }, as: :json, headers: authenticated_header
    end

    assert_response :created
  end

  test "should show hook" do
    get hook_url(@hook), as: :json, headers: authenticated_header
    assert_response :success
  end

  test "should update hook" do
    patch hook_url(@hook), params: { hook: { callback: @hook.callback, threshold: @hook.threshold } }, as: :json, headers: authenticated_header
    assert_response :ok
  end

  test "should destroy hook" do
    assert_difference('Hook.count', -1) do
      delete hook_url(@hook), as: :json, headers: authenticated_header
    end

    assert_response :no_content
  end
end
