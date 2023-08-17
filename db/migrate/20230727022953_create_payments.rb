class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :payment_id
      t.integer :order_number
      t.string :payment_method
      t.string :payment_status
      t.string :receipt_url
      t.string :status_url
      t.string :buyer_email
      t.string :buyer_name
      t.string :buyer_phone
      t.decimal :transaction_amount, precision: 10, scale: 2
      t.string :retry_url

      t.timestamps
    end
  end
end
