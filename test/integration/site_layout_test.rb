require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", browse_path
    assert_select "a[href=?]", about_path
  end

  test "page titles" do
    get signup_path
    assert_select "title", full_title("Sign up")
  end
end
