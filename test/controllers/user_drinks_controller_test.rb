require 'test_helper'

class UserDrinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_drinks_index_url
    assert_response :success
  end

  test "should get show" do
    get user_drinks_show_url
    assert_response :success
  end

  test "should get new" do
    get user_drinks_new_url
    assert_response :success
  end

  test "should get create" do
    get user_drinks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_drinks_destroy_url
    assert_response :success
  end

end
