class Order < ApplicationRecord
    has_many :carts
    has_many :tickets, through: :carts

    def total
        carts.to_a.sum{ |cart| cart.total}
    end
end
