require "test_helper"

class Admin::ResipesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_resipes_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_resipes_edit_url
    assert_response :success
  end

  test "should get index" do
    get admin_resipes_index_url
    assert_response :success
  end
end
