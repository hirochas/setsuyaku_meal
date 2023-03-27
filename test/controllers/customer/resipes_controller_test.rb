require "test_helper"

class Customer::ResipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_resipes_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_resipes_show_url
    assert_response :success
  end

  test "should get new" do
    get customer_resipes_new_url
    assert_response :success
  end

  test "should get edit" do
    get customer_resipes_edit_url
    assert_response :success
  end
end
