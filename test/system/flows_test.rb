require "application_system_test_case"

class FlowsTest < ApplicationSystemTestCase
  setup do
    @flow = flows(:one)
  end

  test "visiting the index" do
    visit flows_url
    assert_selector "h1", text: "Flows"
  end

  test "creating a Flow" do
    visit flows_url
    click_on "New Flow"

    fill_in "Flow Name", with: @flow.flow_name
    fill_in "Flow Order", with: @flow.flow_order
    fill_in "Flow Type", with: @flow.flow_type
    click_on "Create Flow"

    assert_text "Flow was successfully created"
    click_on "Back"
  end

  test "updating a Flow" do
    visit flows_url
    click_on "Edit", match: :first

    fill_in "Flow Name", with: @flow.flow_name
    fill_in "Flow Order", with: @flow.flow_order
    fill_in "Flow Type", with: @flow.flow_type
    click_on "Update Flow"

    assert_text "Flow was successfully updated"
    click_on "Back"
  end

  test "destroying a Flow" do
    visit flows_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Flow was successfully destroyed"
  end
end
