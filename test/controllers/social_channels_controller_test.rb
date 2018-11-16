require 'test_helper'

class SocialChannelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @social_channel = social_channels(:one)
  end

  test "should get index" do
    get social_channels_url
    assert_response :success
  end

  test "should get new" do
    get new_social_channel_url
    assert_response :success
  end

  test "should create social_channel" do
    assert_difference('SocialChannel.count') do
      post social_channels_url, params: { social_channel: { name: @social_channel.name } }
    end

    assert_redirected_to social_channel_url(SocialChannel.last)
  end

  test "should show social_channel" do
    get social_channel_url(@social_channel)
    assert_response :success
  end

  test "should get edit" do
    get edit_social_channel_url(@social_channel)
    assert_response :success
  end

  test "should update social_channel" do
    patch social_channel_url(@social_channel), params: { social_channel: { name: @social_channel.name } }
    assert_redirected_to social_channel_url(@social_channel)
  end

  test "should destroy social_channel" do
    assert_difference('SocialChannel.count', -1) do
      delete social_channel_url(@social_channel)
    end

    assert_redirected_to social_channels_url
  end
end
