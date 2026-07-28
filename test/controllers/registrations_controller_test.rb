require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "new" do
    get new_registration_path
    assert_response :success
  end

  test "create with valid params" do
    assert_difference "User.count", 1 do
      post registration_path, params: { user: { name: "New User", email_address: "new@example.com", phone: "16999990000", password: "password" } }
    end

    assert_redirected_to root_path
    assert cookies[:session_id]
  end

  test "create with invalid params" do
    assert_no_difference "User.count" do
      post registration_path, params: { user: { name: "New User", email_address: "", password: "password" } }
    end

    assert_response :unprocessable_entity
  end
end
