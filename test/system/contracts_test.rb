require "application_system_test_case"

class ContractsTest < ApplicationSystemTestCase
  setup do
    @contract = contracts(:one)
  end

  test "visiting the index" do
    visit contracts_url
    assert_selector "h1", text: "Contracts"
  end

  test "creating a Contract" do
    visit contracts_url
    click_on "New Contract"

    fill_in "Campaigns", with: @contract.campaigns_id
    fill_in "Comment", with: @contract.comment
    fill_in "Contract Image", with: @contract.contract_image
    fill_in "Contract Price", with: @contract.contract_price
    fill_in "Creator", with: @contract.creator_id
    fill_in "Down Payment", with: @contract.down_payment
    fill_in "Down Payment Date", with: @contract.down_payment_date
    fill_in "Marketer", with: @contract.marketer_id
    fill_in "Rest Payment", with: @contract.rest_payment
    fill_in "Rest Payment Date", with: @contract.rest_payment_date
    click_on "Create Contract"

    assert_text "Contract was successfully created"
    click_on "Back"
  end

  test "updating a Contract" do
    visit contracts_url
    click_on "Edit", match: :first

    fill_in "Campaigns", with: @contract.campaigns_id
    fill_in "Comment", with: @contract.comment
    fill_in "Contract Image", with: @contract.contract_image
    fill_in "Contract Price", with: @contract.contract_price
    fill_in "Creator", with: @contract.creator_id
    fill_in "Down Payment", with: @contract.down_payment
    fill_in "Down Payment Date", with: @contract.down_payment_date
    fill_in "Marketer", with: @contract.marketer_id
    fill_in "Rest Payment", with: @contract.rest_payment
    fill_in "Rest Payment Date", with: @contract.rest_payment_date
    click_on "Update Contract"

    assert_text "Contract was successfully updated"
    click_on "Back"
  end

  test "destroying a Contract" do
    visit contracts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contract was successfully destroyed"
  end
end
