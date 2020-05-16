require 'test_helper'

class IxamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ixam = ixams(:one)
  end

  test "should get index" do
    get ixams_url
    assert_response :success
  end

  test "should get new" do
    get new_ixam_url
    assert_response :success
  end

  test "should create ixam" do
    assert_difference('Ixam.count') do
      post ixams_url, params: { ixam: { name: @ixam.name } }
    end

    assert_redirected_to ixam_url(Ixam.last)
  end

  test "should show ixam" do
    get ixam_url(@ixam)
    assert_response :success
  end

  test "should get edit" do
    get edit_ixam_url(@ixam)
    assert_response :success
  end

  test "should update ixam" do
    patch ixam_url(@ixam), params: { ixam: { name: @ixam.name } }
    assert_redirected_to ixam_url(@ixam)
  end

  test "should destroy ixam" do
    assert_difference('Ixam.count', -1) do
      delete ixam_url(@ixam)
    end

    assert_redirected_to ixams_url
  end
end
