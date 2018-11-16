json.extract! contract, :id, :creator_id, :marketer_id, :campaigns_id, :contract_price, :down_payment_date, :down_payment, :rest_payment_date, :rest_payment, :contract_image, :comment, :created_at, :updated_at
json.url contract_url(contract, format: :json)
