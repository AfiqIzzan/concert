class Ticket < ApplicationRecord
    belongs_to :event, inverse_of: :tickets
    has_many :line_items
    has_many :orders, through: :line_items
end
