require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should get browse" do
    get '/browse'
    assert_response :success
    assert_select "title", "Browse | Cinematheque"
  end

end
