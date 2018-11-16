require "application_system_test_case"

class CreatorExtsTest < ApplicationSystemTestCase
  setup do
    @creator_ext = creator_exts(:one)
  end

  test "visiting the index" do
    visit creator_exts_url
    assert_selector "h1", text: "Creator Exts"
  end

  test "creating a Creator ext" do
    visit creator_exts_url
    click_on "New Creator Ext"

    fill_in "Avatar", with: @creator_ext.avatar
    fill_in "Category", with: @creator_ext.category_id
    fill_in "Tags Set", with: @creator_ext.tags_set
    fill_in "Userid", with: @creator_ext.userid
    click_on "Create Creator ext"

    assert_text "Creator ext was successfully created"
    click_on "Back"
  end

  test "updating a Creator ext" do
    visit creator_exts_url
    click_on "Edit", match: :first

    fill_in "Avatar", with: @creator_ext.avatar
    fill_in "Category", with: @creator_ext.category_id
    fill_in "Tags Set", with: @creator_ext.tags_set
    fill_in "Userid", with: @creator_ext.userid
    click_on "Update Creator ext"

    assert_text "Creator ext was successfully updated"
    click_on "Back"
  end

  test "destroying a Creator ext" do
    visit creator_exts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Creator ext was successfully destroyed"
  end
end
