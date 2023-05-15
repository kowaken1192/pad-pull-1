require "test_helper"

class NewConfrimControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get new_confrim_index_url
    assert_response :success
  end
end
