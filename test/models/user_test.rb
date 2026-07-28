require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "downcases and strips email_address" do
    user = User.new(email_address: " DOWNCASED@EXAMPLE.COM ")
    assert_equal("downcased@example.com", user.email_address)
  end

  test "requires email_address" do
    user = User.new(email_address: "")
    assert_not user.valid?
    assert_includes user.errors[:email_address], I18n.t("activerecord.errors.messages.blank")
  end

  test "requires a unique email_address" do
    user = User.new(email_address: users(:one).email_address)
    assert_not user.valid?
    assert_includes user.errors[:email_address], I18n.t("activerecord.errors.messages.taken")
  end

  test "authenticates with the correct password" do
    assert users(:one).authenticate("password")
  end

  test "does not authenticate with the wrong password" do
    assert_not users(:one).authenticate("wrong")
  end

  test "defaults role to member" do
    assert User.new.member?
  end

  test "can be admin" do
    assert users(:admin).admin?
  end

  test "destroys associated sessions when the user is destroyed" do
    user = users(:one)
    user.sessions.create!

    assert_difference "Session.count", -1 do
      user.destroy
    end
  end
end
