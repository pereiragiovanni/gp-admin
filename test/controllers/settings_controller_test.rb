require "test_helper"

class SettingsControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in_as users(:one) }

  test "edit" do
    get edit_settings_path
    assert_response :success
  end

  test "update with valid params" do
    patch settings_path, params: { user: { name: "Updated Name" } }

    assert_redirected_to edit_settings_path
    assert_equal "Updated Name", users(:one).reload.name
  end

  test "update with invalid params" do
    patch settings_path, params: { user: { email_address: users(:two).email_address } }

    assert_response :unprocessable_entity
  end

  test "remove_avatar" do
    users(:one).avatar.attach(fixture_file_upload("avatar.png", "image/png"))

    delete remove_avatar_path

    assert_redirected_to edit_settings_path
    assert_not users(:one).reload.avatar.attached?
  end
end
