json.extract! bizcase, :id, :bizcase_author, :bizcase_date, :bizcase_title, :bizcase_content, :bizcase_status, :bizcase_modified, :bizcase_type, :bizcase_link, :string, :created_at, :updated_at
json.url bizcase_url(bizcase, format: :json)
