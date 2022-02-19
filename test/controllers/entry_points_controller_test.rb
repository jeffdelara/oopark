require "test_helper"

class EntryPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry_point = entry_points(:one)
  end

  test "should get index" do
    get entry_points_url
    assert_response :success
  end

  test "should get new" do
    get new_entry_point_url
    assert_response :success
  end

  test "should create entry_point" do
    assert_difference('EntryPoint.count') do
      post entry_points_url, params: { entry_point: { name: @entry_point.name, x: @entry_point.x, y: @entry_point.y } }
    end

    assert_redirected_to entry_point_url(EntryPoint.last)
  end

  test "should show entry_point" do
    get entry_point_url(@entry_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_entry_point_url(@entry_point)
    assert_response :success
  end

  test "should update entry_point" do
    patch entry_point_url(@entry_point), params: { entry_point: { name: @entry_point.name, x: @entry_point.x, y: @entry_point.y } }
    assert_redirected_to entry_point_url(@entry_point)
  end

  test "should destroy entry_point" do
    assert_difference('EntryPoint.count', -1) do
      delete entry_point_url(@entry_point)
    end

    assert_redirected_to entry_points_url
  end
end
