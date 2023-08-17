class Cart < ApplicationRecord
    has_many :line_items
    has_many :tickets

    def total
        line_items.to_a.sum(&:total)
    end
end
