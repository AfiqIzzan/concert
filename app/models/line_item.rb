class LineItem < ApplicationRecord
  belongs_to :ticket
  belongs_to :cart

  def total
    ticket.price * quantity
  end

end
