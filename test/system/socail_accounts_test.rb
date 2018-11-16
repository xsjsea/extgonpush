require "application_system_test_case"

class SocailAccountsTest < ApplicationSystemTestCase
  setup do
    @socail_account = socail_accounts(:one)
  end

  test "visiting the index" do
    visit socail_accounts_url
    assert_selector "h1", text: "Socail Accounts"
  end

  test "creating a Socail account" do
    visit socail_accounts_url
    click_on "New Socail Account"

    fill_in "Channel", with: @socail_account.channel_id
    fill_in "Channel Name", with: @socail_account.channel_name
    fill_in "Channel Value", with: @socail_account.channel_value
    fill_in "Creator", with: @socail_account.creator_id
    click_on "Create Socail account"

    assert_text "Socail account was successfully created"
    click_on "Back"
  end

  test "updating a Socail account" do
    visit socail_accounts_url
    click_on "Edit", match: :first

    fill_in "Channel", with: @socail_account.channel_id
    fill_in "Channel Name", with: @socail_account.channel_name
    fill_in "Channel Value", with: @socail_account.channel_value
    fill_in "Creator", with: @socail_account.creator_id
    click_on "Update Socail account"

    assert_text "Socail account was successfully updated"
    click_on "Back"
  end

  test "destroying a Socail account" do
    visit socail_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Socail account was successfully destroyed"
  end
end
