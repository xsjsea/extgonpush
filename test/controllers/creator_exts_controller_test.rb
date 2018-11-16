require 'test_helper'

class CreatorExtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creator_ext = creator_exts(:one)
  end

  test "should get index" do
    get creator_exts_url
    assert_response :success
  end

  test "should get new" do
    get new_creator_ext_url
    assert_response :success
  end

  test "should create creator_ext" do
    assert_difference('CreatorExt.count') do
      post creator_exts_url, params: { creator_ext: { avatar: @creator_ext.avatar, category_id: @creator_ext.category_id, tags_set: @creator_ext.tags_set, userid: @creator_ext.userid } }
    end

    assert_redirected_to creator_ext_url(CreatorExt.last)
  end

  test "should show creator_ext" do
    get creator_ext_url(@creator_ext)
    assert_response :success
  end

  test "should get edit" do
    get edit_creator_ext_url(@creator_ext)
    assert_response :success
  end

  test "should update creator_ext" do
    patch creator_ext_url(@creator_ext), params: { creator_ext: { avatar: @creator_ext.avatar, category_id: @creator_ext.category_id, tags_set: @creator_ext.tags_set, userid: @creator_ext.userid } }
    assert_redirected_to creator_ext_url(@creator_ext)
  end

  test "should destroy creator_ext" do
    assert_difference('CreatorExt.count', -1) do
      delete creator_ext_url(@creator_ext)
    end

    assert_redirected_to creator_exts_url
  end
end
