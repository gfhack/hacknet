require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    User.new(name: "outro", email: "outro@example.com", password: "foo123", password_confirmation: "foo123")
  end

  test "current_user returns right user when session is nil" do
    assert_equal @user, current_user
    assert !logged_in?
  end
end
