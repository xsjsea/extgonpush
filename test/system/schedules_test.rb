require "application_system_test_case"

class SchedulesTest < ApplicationSystemTestCase
  setup do
    @schedule = schedules(:one)
  end

  test "visiting the index" do
    visit schedules_url
    assert_selector "h1", text: "Schedules"
  end

  test "creating a Schedule" do
    visit schedules_url
    click_on "New Schedule"

    fill_in "Campaign", with: @schedule.campaign_id
    fill_in "Ends On", with: @schedule.ends_on
    fill_in "Flow Name", with: @schedule.flow_name
    fill_in "Flow Order", with: @schedule.flow_order
    fill_in "Post", with: @schedule.post_id
    fill_in "Starts On", with: @schedule.starts_on
    fill_in "Status", with: @schedule.status
    fill_in "Workdays", with: @schedule.workdays
    click_on "Create Schedule"

    assert_text "Schedule was successfully created"
    click_on "Back"
  end

  test "updating a Schedule" do
    visit schedules_url
    click_on "Edit", match: :first

    fill_in "Campaign", with: @schedule.campaign_id
    fill_in "Ends On", with: @schedule.ends_on
    fill_in "Flow Name", with: @schedule.flow_name
    fill_in "Flow Order", with: @schedule.flow_order
    fill_in "Post", with: @schedule.post_id
    fill_in "Starts On", with: @schedule.starts_on
    fill_in "Status", with: @schedule.status
    fill_in "Workdays", with: @schedule.workdays
    click_on "Update Schedule"

    assert_text "Schedule was successfully updated"
    click_on "Back"
  end

  test "destroying a Schedule" do
    visit schedules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Schedule was successfully destroyed"
  end
end
