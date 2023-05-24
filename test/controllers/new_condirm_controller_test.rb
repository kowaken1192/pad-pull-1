require "test_helper"

class NewCondirmControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get new_condirm_index_url
    assert_response :success
  end
end
