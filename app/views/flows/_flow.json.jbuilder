json.extract! flow, :id, :flow_type, :flow_name, :flow_order, :created_at, :updated_at
json.url flow_url(flow, format: :json)
