require "application_system_test_case"

class SocialChannelsTest < ApplicationSystemTestCase
  setup do
    @social_channel = social_channels(:one)
  end

  test "visiting the index" do
    visit social_channels_url
    assert_selector "h1", text: "Social Channels"
  end

  test "creating a Social channel" do
    visit social_channels_url
    click_on "New Social Channel"

    fill_in "Name", with: @social_channel.name
    click_on "Create Social channel"

    assert_text "Social channel was successfully created"
    click_on "Back"
  end

  test "updating a Social channel" do
    visit social_channels_url
    click_on "Edit", match: :first

    fill_in "Name", with: @social_channel.name
    click_on "Update Social channel"

    assert_text "Social channel was successfully updated"
    click_on "Back"
  end

  test "destroying a Social channel" do
    visit social_channels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Social channel was successfully destroyed"
  end
end
