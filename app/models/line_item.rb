class LineItem < ApplicationRecord
  belongs_to :ticket
  belongs_to :cart
  belongs_to :order, optional: true

  def total
    ticket.price * quantity
  end

end
