json.extract! schedule, :id, :campaign_id, :flow_name, :flow_order, :starts_on, :ends_on, :workdays, :status, :post_id, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
