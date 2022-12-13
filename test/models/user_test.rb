require 'minitest/autorun'
require "test_helper"

class UserTest < Minitest::Test
  def setup
    @user = User.new(username: "Example User", email: "user@example.com")
  end

  def test_valid
    assert @user.valid?
  end

  def test_username
    @user.username = "     "
    assert_not @user.valid?
  end

  def test_username_length
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  def test_email
    @user.email = "     "
    assert_not @user.valid?
  end

  def test_email_length
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

end
