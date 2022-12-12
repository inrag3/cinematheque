require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should get browse" do
    get browse_path
    assert_response :success
    assert_select "title", "Browse | Cinematheque"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Cinematheque"
  end
end
