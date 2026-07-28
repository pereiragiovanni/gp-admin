require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "index requires admin" do
    sign_in_as users(:one)
    get users_path
    assert_redirected_to root_path
  end

  test "index" do
    sign_in_as users(:admin)
    get users_path
    assert_response :success
  end

  test "update with valid params" do
    sign_in_as users(:admin)

    patch user_path(users(:one)), params: { user: { name: "Renamed" }, page: 1 }, as: :turbo_stream

    assert_response :success
    assert_equal "Renamed", users(:one).reload.name
  end

  test "update with invalid params" do
    sign_in_as users(:admin)

    patch user_path(users(:one)), params: { user: { email_address: "" }, page: 1 }, as: :turbo_stream

    assert_response :success
    assert_not_equal "", users(:one).reload.email_address
  end

  test "update redirects for html format" do
    sign_in_as users(:admin)

    patch user_path(users(:one)), params: { user: { name: "Renamed" }, page: 1 }

    assert_redirected_to users_path(page: 1)
  end
end
