require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "creating a Post" do
    visit posts_url
    click_on "New Post"

    fill_in "Post Author", with: @post.post_author
    fill_in "Post Content", with: @post.post_content
    fill_in "Post Date", with: @post.post_date
    fill_in "Post Modified", with: @post.post_modified
    fill_in "Post Status", with: @post.post_status
    fill_in "Post Title", with: @post.post_title
    fill_in "Post Type", with: @post.post_type
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "updating a Post" do
    visit posts_url
    click_on "Edit", match: :first

    fill_in "Post Author", with: @post.post_author
    fill_in "Post Content", with: @post.post_content
    fill_in "Post Date", with: @post.post_date
    fill_in "Post Modified", with: @post.post_modified
    fill_in "Post Status", with: @post.post_status
    fill_in "Post Title", with: @post.post_title
    fill_in "Post Type", with: @post.post_type
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "destroying a Post" do
    visit posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post was successfully destroyed"
  end
end
