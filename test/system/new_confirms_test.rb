require "application_system_test_case"

class NewConfirmsTest < ApplicationSystemTestCase
  setup do
    @new_confirm = new_confirms(:one)
  end

  test "visiting the index" do
    visit new_confirms_url
    assert_selector "h1", text: "New Confirms"
  end

  test "creating a New confirm" do
    visit new_confirms_url
    click_on "New New Confirm"

    fill_in "Check in", with: @new_confirm.check_in
    fill_in "Check out", with: @new_confirm.check_out
    fill_in "Head count interger", with: @new_confirm.head_count_interger
    fill_in "Room", with: @new_confirm.room_id
    fill_in "User", with: @new_confirm.user_id
    click_on "Create New confirm"

    assert_text "New confirm was successfully created"
    click_on "Back"
  end

  test "updating a New confirm" do
    visit new_confirms_url
    click_on "Edit", match: :first

    fill_in "Check in", with: @new_confirm.check_in
    fill_in "Check out", with: @new_confirm.check_out
    fill_in "Head count interger", with: @new_confirm.head_count_interger
    fill_in "Room", with: @new_confirm.room_id
    fill_in "User", with: @new_confirm.user_id
    click_on "Update New confirm"

    assert_text "New confirm was successfully updated"
    click_on "Back"
  end

  test "destroying a New confirm" do
    visit new_confirms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "New confirm was successfully destroyed"
  end
end
