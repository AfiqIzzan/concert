class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy
    has_many :tickets, through: :line_items

    def total
        line_items.to_a.sum(&:total)
    end
end
