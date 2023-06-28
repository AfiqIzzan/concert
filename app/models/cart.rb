class Cart < ApplicationRecord
  belongs_to :ticket
  belongs_to :order

  def total
    ticket.price * quantity
  end
end
