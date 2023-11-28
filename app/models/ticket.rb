class Ticket < ApplicationRecord
    belongs_to :event, inverse_of: :tickets
    validates :name, presence: true
    validates :price, presence: true
    validates :quantity, presence: true
end
