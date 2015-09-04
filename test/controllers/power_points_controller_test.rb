require 'test_helper'

class PowerPointsControllerTest < ActionController::TestCase
  setup do
    @power_point = power_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:power_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create power_point" do
    assert_difference('PowerPoint.count') do
      post :create, power_point: { file_name: @power_point.file_name, file_size: @power_point.file_size, file_type: @power_point.file_type, name: @power_point.name, output_path: @power_point.output_path }
    end

    assert_redirected_to power_point_path(assigns(:power_point))
  end

  test "should show power_point" do
    get :show, id: @power_point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @power_point
    assert_response :success
  end

  test "should update power_point" do
    patch :update, id: @power_point, power_point: { file_name: @power_point.file_name, file_size: @power_point.file_size, file_type: @power_point.file_type, name: @power_point.name, output_path: @power_point.output_path }
    assert_redirected_to power_point_path(assigns(:power_point))
  end

  test "should destroy power_point" do
    assert_difference('PowerPoint.count', -1) do
      delete :destroy, id: @power_point
    end

    assert_redirected_to power_points_path
  end
end
