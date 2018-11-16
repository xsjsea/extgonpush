json.extract! post, :id, :post_author, :post_date, :post_title, :post_content, :post_status, :post_modified, :post_type, :created_at, :updated_at
json.url post_url(post, format: :json)
