require "application_system_test_case"

class CasesTest < ApplicationSystemTestCase
  setup do
    @case = cases(:one)
  end

  test "visiting the index" do
    visit cases_url
    assert_selector "h1", text: "Cases"
  end

  test "creating a Case" do
    visit cases_url
    click_on "New Case"

    fill_in "Case Author", with: @case.case_author
    fill_in "Case Content", with: @case.case_content
    fill_in "Case Date", with: @case.case_date
    fill_in "Case Modified", with: @case.case_modified
    fill_in "Case Status", with: @case.case_status
    fill_in "Case Title", with: @case.case_title
    fill_in "Case Type", with: @case.case_type
    click_on "Create Case"

    assert_text "Case was successfully created"
    click_on "Back"
  end

  test "updating a Case" do
    visit cases_url
    click_on "Edit", match: :first

    fill_in "Case Author", with: @case.case_author
    fill_in "Case Content", with: @case.case_content
    fill_in "Case Date", with: @case.case_date
    fill_in "Case Modified", with: @case.case_modified
    fill_in "Case Status", with: @case.case_status
    fill_in "Case Title", with: @case.case_title
    fill_in "Case Type", with: @case.case_type
    click_on "Update Case"

    assert_text "Case was successfully updated"
    click_on "Back"
  end

  test "destroying a Case" do
    visit cases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Case was successfully destroyed"
  end
end
