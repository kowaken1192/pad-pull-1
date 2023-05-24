require "application_system_test_case"

class ReservesTest < ApplicationSystemTestCase
  setup do
    @reserf = reserves(:one)
  end

  test "visiting the index" do
    visit reserves_url
    assert_selector "h1", text: "Reserves"
  end

  test "creating a Reserve" do
    visit reserves_url
    click_on "New Reserve"

    fill_in "Check in", with: @reserf.check_in
    fill_in "Check out", with: @reserf.check_out
    fill_in "People", with: @reserf.people
    fill_in "Room", with: @reserf.room_id
    fill_in "User", with: @reserf.user_id
    click_on "Create Reserve"

    assert_text "Reserve was successfully created"
    click_on "Back"
  end

  test "updating a Reserve" do
    visit reserves_url
    click_on "Edit", match: :first

    fill_in "Check in", with: @reserf.check_in
    fill_in "Check out", with: @reserf.check_out
    fill_in "People", with: @reserf.people
    fill_in "Room", with: @reserf.room_id
    fill_in "User", with: @reserf.user_id
    click_on "Update Reserve"

    assert_text "Reserve was successfully updated"
    click_on "Back"
  end

  test "destroying a Reserve" do
    visit reserves_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reserve was successfully destroyed"
  end
end
