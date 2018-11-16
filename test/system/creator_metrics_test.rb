require "application_system_test_case"

class CreatorMetricsTest < ApplicationSystemTestCase
  setup do
    @creator_metric = creator_metrics(:one)
  end

  test "visiting the index" do
    visit creator_metrics_url
    assert_selector "h1", text: "Creator Metrics"
  end

  test "creating a Creator metric" do
    visit creator_metrics_url
    click_on "New Creator Metric"

    fill_in "Creator", with: @creator_metric.creator_id
    fill_in "Metric", with: @creator_metric.metric_id
    fill_in "Metric Name", with: @creator_metric.metric_name
    fill_in "Metric Value", with: @creator_metric.metric_value
    click_on "Create Creator metric"

    assert_text "Creator metric was successfully created"
    click_on "Back"
  end

  test "updating a Creator metric" do
    visit creator_metrics_url
    click_on "Edit", match: :first

    fill_in "Creator", with: @creator_metric.creator_id
    fill_in "Metric", with: @creator_metric.metric_id
    fill_in "Metric Name", with: @creator_metric.metric_name
    fill_in "Metric Value", with: @creator_metric.metric_value
    click_on "Update Creator metric"

    assert_text "Creator metric was successfully updated"
    click_on "Back"
  end

  test "destroying a Creator metric" do
    visit creator_metrics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Creator metric was successfully destroyed"
  end
end
