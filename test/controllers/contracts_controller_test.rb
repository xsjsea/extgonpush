require 'test_helper'

class ContractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract = contracts(:one)
  end

  test "should get index" do
    get contracts_url
    assert_response :success
  end

  test "should get new" do
    get new_contract_url
    assert_response :success
  end

  test "should create contract" do
    assert_difference('Contract.count') do
      post contracts_url, params: { contract: { campaigns_id: @contract.campaigns_id, comment: @contract.comment, contract_image: @contract.contract_image, contract_price: @contract.contract_price, creator_id: @contract.creator_id, down_payment: @contract.down_payment, down_payment_date: @contract.down_payment_date, marketer_id: @contract.marketer_id, rest_payment: @contract.rest_payment, rest_payment_date: @contract.rest_payment_date } }
    end

    assert_redirected_to contract_url(Contract.last)
  end

  test "should show contract" do
    get contract_url(@contract)
    assert_response :success
  end

  test "should get edit" do
    get edit_contract_url(@contract)
    assert_response :success
  end

  test "should update contract" do
    patch contract_url(@contract), params: { contract: { campaigns_id: @contract.campaigns_id, comment: @contract.comment, contract_image: @contract.contract_image, contract_price: @contract.contract_price, creator_id: @contract.creator_id, down_payment: @contract.down_payment, down_payment_date: @contract.down_payment_date, marketer_id: @contract.marketer_id, rest_payment: @contract.rest_payment, rest_payment_date: @contract.rest_payment_date } }
    assert_redirected_to contract_url(@contract)
  end

  test "should destroy contract" do
    assert_difference('Contract.count', -1) do
      delete contract_url(@contract)
    end

    assert_redirected_to contracts_url
  end
end
