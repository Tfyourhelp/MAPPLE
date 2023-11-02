require "test_helper"

class CheckoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get success" do
    get checkouts_success_url
    assert_response :success
  end
end
