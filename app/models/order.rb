class Order < ApplicationRecord
    has_many :line_items, dependent: :destroy
    has_many :tickets, through: :line_items

    def generate_checksum
        Rails.logger.info("Generating checksum for order #{id}")
        string = "#{email}|#{name}|#{phone}||#{id}|#{name}|http://localhost:3000/orders/#{id}/paymentredirect|#{total}|be5cd73a-d958-491a-9c37-9078c1b3bb31"
        puts(string)
        checksum_token = "5dc5db2a3e82ae36d0c4bbe374e08df93f4282a3c1287a12cbce40cc7874d98f"
        OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, string)
    end

end
