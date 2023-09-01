json.extract! payment, :id, :payment_id, :order_number, :payment_method, :payment_status, :receipt_url, :status_url, :buyer_email, :buyer_name, :buyer_phone, :transaction_amount, :retry_url, :created_at, :updated_at
json.url payment_url(payment, format: :json)
