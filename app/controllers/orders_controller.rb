class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order = Order.find(params[:id])
  end

  # GET /orders/new
  def new
    @order = Order.new
  end


  # POST /orders or /orders.json
  def create
    @cart = Cart.find_by(id: session[:cart_id])
    @order = Order.new(order_params)
    
    @order.total = @cart.total


    respond_to do |format|
      if @order.save
        @cart.line_items.each do |line_item|
          # associate the line_item with the order
          line_item.order_id = @order.id
          # reduce the quantity of the ticket
          ticket = Ticket.find(line_item.ticket_id)
          ticket.quantity -= line_item.quantity
          ticket.save
          # save the line_item
          line_item.save
        end
        # clear the cart
        session[:cart_id] = nil

        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:name, :email, :phone, :total)
    end
end
