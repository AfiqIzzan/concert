class Ticket < ApplicationRecord
    belongs_to :event, inverse_of: :tickets
    has_many :carts
    has_many :orders, through: :carts
end
