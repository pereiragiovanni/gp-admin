require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "index requires authentication" do
    get root_path
    assert_redirected_to new_session_path
  end

  test "index" do
    sign_in_as users(:one)
    get root_path
    assert_response :success
  end
end
