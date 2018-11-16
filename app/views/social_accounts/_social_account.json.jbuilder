json.extract! social_account, :id, :creator_id, :channel_id, :channel_name, :channel_value, :created_at, :updated_at
json.url social_account_url(social_account, format: :json)
