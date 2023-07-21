class Order < ApplicationRecord
    has_many :line_items, dependent: :destroy
    has_many :tickets, through: :line_items
end
