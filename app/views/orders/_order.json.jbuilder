json.extract! order, :id, :name, :email, :phone, :total, :created_at, :updated_at
json.url order_url(order, format: :json)
