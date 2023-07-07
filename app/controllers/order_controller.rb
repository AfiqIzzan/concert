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

  def add_all
    @order = Order.find_by(id: params[:order_id])
    @ticket = Ticket.find_by(id: params[:ticket_id])
    @current_order = Order.find_by(id: session[:order_id])
    
    if @order.nil? && @current_order.nil?
      @order = Order.create
      session[:order_id] = @order.id
    elsif @order.nil?
      @order = @current_order
    end

    params[:tickets].each do |_, ticket_params|
      ticket_id = ticket_params[:id].to_i
      quantity = ticket_params[:quantity].to_i
  
      next if quantity <= 0
      current_cart = @order.carts.find_by(ticket_id: ticket_id)
  
      if current_cart
        current_cart.update(quantity: current_cart.quantity + quantity)
      else
        cart = Cart.find_by(ticket_id: ticket_id)
  
        if cart && cart.order.nil?
          cart.update(quantity: quantity, order: @order)
        else
          @order.carts.create(ticket_id: ticket_id, quantity: quantity)
        end
      end
    end
    redirect_to order_path
  end

  def remove
    Cart.find_by(id: params[:id]).destroy
  end
end
