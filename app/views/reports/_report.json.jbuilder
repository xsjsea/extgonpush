json.extract! report, :id, :report_author, :report_date, :report_title, :report_content, :report_status, :post_modified, :report_type, :created_at, :updated_at
json.url report_url(report, format: :json)
