class OrderController < ApplicationController
  def show
    @render_order = false
  end

  def add
    @ticket = Ticket.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_cart = @order.carts.find_by(ticket_id: @ticket.id)
    if current_cart && quantity > 0
      current_cart.update(quantity:)
    elsif quantity <= 0
      current_cart.destroy
    else
      @order.carts.create(ticket: @ticket, quantity:)
    end
  end

  def remove
    Cart.find_by(id: params[:id]).destroy
  end
end
