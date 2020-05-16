require "application_system_test_case"

class IxamsTest < ApplicationSystemTestCase
  setup do
    @ixam = ixams(:one)
  end

  test "visiting the index" do
    visit ixams_url
    assert_selector "h1", text: "Ixams"
  end

  test "creating a Ixam" do
    visit ixams_url
    click_on "New Ixam"

    fill_in "Name", with: @ixam.name
    click_on "Create Ixam"

    assert_text "Ixam was successfully created"
    click_on "Back"
  end

  test "updating a Ixam" do
    visit ixams_url
    click_on "Edit", match: :first

    fill_in "Name", with: @ixam.name
    click_on "Update Ixam"

    assert_text "Ixam was successfully updated"
    click_on "Back"
  end

  test "destroying a Ixam" do
    visit ixams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ixam was successfully destroyed"
  end
end
