require "test_helper"

class NewConfirmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_confirm = new_confirms(:one)
  end

  test "should get index" do
    get new_confirms_url
    assert_response :success
  end

  test "should get new" do
    get new_new_confirm_url
    assert_response :success
  end

  test "should create new_confirm" do
    assert_difference('NewConfirm.count') do
      post new_confirms_url, params: { new_confirm: { check_in: @new_confirm.check_in, check_out: @new_confirm.check_out, head_count_interger: @new_confirm.head_count_interger, room_id: @new_confirm.room_id, user_id: @new_confirm.user_id } }
    end

    assert_redirected_to new_confirm_url(NewConfirm.last)
  end

  test "should show new_confirm" do
    get new_confirm_url(@new_confirm)
    assert_response :success
  end

  test "should get edit" do
    get edit_new_confirm_url(@new_confirm)
    assert_response :success
  end

  test "should update new_confirm" do
    patch new_confirm_url(@new_confirm), params: { new_confirm: { check_in: @new_confirm.check_in, check_out: @new_confirm.check_out, head_count_interger: @new_confirm.head_count_interger, room_id: @new_confirm.room_id, user_id: @new_confirm.user_id } }
    assert_redirected_to new_confirm_url(@new_confirm)
  end

  test "should destroy new_confirm" do
    assert_difference('NewConfirm.count', -1) do
      delete new_confirm_url(@new_confirm)
    end

    assert_redirected_to new_confirms_url
  end
end
