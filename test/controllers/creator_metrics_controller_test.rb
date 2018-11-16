require 'test_helper'

class CreatorMetricsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creator_metric = creator_metrics(:one)
  end

  test "should get index" do
    get creator_metrics_url
    assert_response :success
  end

  test "should get new" do
    get new_creator_metric_url
    assert_response :success
  end

  test "should create creator_metric" do
    assert_difference('CreatorMetric.count') do
      post creator_metrics_url, params: { creator_metric: { creator_id: @creator_metric.creator_id, metric_id: @creator_metric.metric_id, metric_name: @creator_metric.metric_name, metric_value: @creator_metric.metric_value } }
    end

    assert_redirected_to creator_metric_url(CreatorMetric.last)
  end

  test "should show creator_metric" do
    get creator_metric_url(@creator_metric)
    assert_response :success
  end

  test "should get edit" do
    get edit_creator_metric_url(@creator_metric)
    assert_response :success
  end

  test "should update creator_metric" do
    patch creator_metric_url(@creator_metric), params: { creator_metric: { creator_id: @creator_metric.creator_id, metric_id: @creator_metric.metric_id, metric_name: @creator_metric.metric_name, metric_value: @creator_metric.metric_value } }
    assert_redirected_to creator_metric_url(@creator_metric)
  end

  test "should destroy creator_metric" do
    assert_difference('CreatorMetric.count', -1) do
      delete creator_metric_url(@creator_metric)
    end

    assert_redirected_to creator_metrics_url
  end
end
