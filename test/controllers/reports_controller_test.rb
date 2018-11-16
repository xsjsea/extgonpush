require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports(:one)
  end

  test "should get index" do
    get reports_url
    assert_response :success
  end

  test "should get new" do
    get new_report_url
    assert_response :success
  end

  test "should create report" do
    assert_difference('Report.count') do
      post reports_url, params: { report: { post_modified: @report.post_modified, report_author: @report.report_author, report_content: @report.report_content, report_date: @report.report_date, report_status: @report.report_status, report_title: @report.report_title, report_type: @report.report_type } }
    end

    assert_redirected_to report_url(Report.last)
  end

  test "should show report" do
    get report_url(@report)
    assert_response :success
  end

  test "should get edit" do
    get edit_report_url(@report)
    assert_response :success
  end

  test "should update report" do
    patch report_url(@report), params: { report: { post_modified: @report.post_modified, report_author: @report.report_author, report_content: @report.report_content, report_date: @report.report_date, report_status: @report.report_status, report_title: @report.report_title, report_type: @report.report_type } }
    assert_redirected_to report_url(@report)
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete report_url(@report)
    end

    assert_redirected_to reports_url
  end
end
