require 'minitest/autorun'
require "test_helper"

class UserTest < Minitest::Test
  def setup
    @user = User.new(username: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  def test_valid
    assert @user.valid?
  end

  def test_username
    @user.username = "     "
    assert_not @user.valid?
  end

  def test_username_length
    @user.username = "a" * 51
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

  def test_valid_email_address
    valid_addresses = %w[user@example.com USER@foo.COM QWErty@ru.co.org
                         foo.foo@foo.xyz]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?
    end
  end

  def test_invalid_email_address
    invalid_addresses = %w[user@example,com USER.foo.COM QWErty@ru.co@org
                         foo.foo@foo_foo.xyz foo.foo@foo+foo.xyz]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?
    end
  end

  def test_unique_email
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
    duplicate_user.email = @user.email.upcase
    assert_not duplicate_user.valid?
  end
end
