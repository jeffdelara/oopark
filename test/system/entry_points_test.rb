require "application_system_test_case"

class EntryPointsTest < ApplicationSystemTestCase
  setup do
    @entry_point = entry_points(:one)
  end

  test "visiting the index" do
    visit entry_points_url
    assert_selector "h1", text: "Entry Points"
  end

  test "creating a Entry point" do
    visit entry_points_url
    click_on "New Entry Point"

    fill_in "Name", with: @entry_point.name
    fill_in "X", with: @entry_point.x
    fill_in "Y", with: @entry_point.y
    click_on "Create Entry point"

    assert_text "Entry point was successfully created"
    click_on "Back"
  end

  test "updating a Entry point" do
    visit entry_points_url
    click_on "Edit", match: :first

    fill_in "Name", with: @entry_point.name
    fill_in "X", with: @entry_point.x
    fill_in "Y", with: @entry_point.y
    click_on "Update Entry point"

    assert_text "Entry point was successfully updated"
    click_on "Back"
  end

  test "destroying a Entry point" do
    visit entry_points_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entry point was successfully destroyed"
  end
end
