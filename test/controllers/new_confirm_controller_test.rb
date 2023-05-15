require "test_helper"

class NewConfirmControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get new_confirm_index_url
    assert_response :success
  end
end
