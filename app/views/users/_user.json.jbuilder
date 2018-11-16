json.extract! user, :id, :status, :usertype, :username, :truename, :password, :province_id, :city_id, :distirct_id, :address, :user_comment, :created_at, :updated_at
json.url user_url(user, format: :json)
