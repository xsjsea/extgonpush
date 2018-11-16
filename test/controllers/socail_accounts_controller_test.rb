require 'test_helper'

class SocailAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @socail_account = socail_accounts(:one)
  end

  test "should get index" do
    get socail_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_socail_account_url
    assert_response :success
  end

  test "should create socail_account" do
    assert_difference('SocailAccount.count') do
      post socail_accounts_url, params: { socail_account: { channel_id: @socail_account.channel_id, channel_name: @socail_account.channel_name, channel_value: @socail_account.channel_value, creator_id: @socail_account.creator_id } }
    end

    assert_redirected_to socail_account_url(SocailAccount.last)
  end

  test "should show socail_account" do
    get socail_account_url(@socail_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_socail_account_url(@socail_account)
    assert_response :success
  end

  test "should update socail_account" do
    patch socail_account_url(@socail_account), params: { socail_account: { channel_id: @socail_account.channel_id, channel_name: @socail_account.channel_name, channel_value: @socail_account.channel_value, creator_id: @socail_account.creator_id } }
    assert_redirected_to socail_account_url(@socail_account)
  end

  test "should destroy socail_account" do
    assert_difference('SocailAccount.count', -1) do
      delete socail_account_url(@socail_account)
    end

    assert_redirected_to socail_accounts_url
  end
end
