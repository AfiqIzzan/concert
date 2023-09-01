class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy
    has_many :tickets, through: :line_items

    def total
        total = 0
        self.line_items.each do |line_item|
            total += line_item.quantity * line_item.ticket.price
        end
        total
    end
    
end
