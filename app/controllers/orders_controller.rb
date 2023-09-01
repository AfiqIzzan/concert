class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, only: [:paymentredirect]


  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order = Order.find(params[:id])
    @payment = Payment.find_by(order_number: @order.id)
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  def paymentredirect
    payment_status = params[:payment_status]
    if payment_status == "true"
      params_payment = {
        payment_id: params[:payment_id],
        order_number: params[:order_number],
        payment_method: params[:payment_method],
        payment_status: params[:payment_status],
        receipt_url: params[:receipt_url],
        status_url: params[:status_url],
        retry_url: params[:retry_url],
        buyer_email: params[:buyer_email],
        buyer_name: params[:buyer_name],
        buyer_phone: params[:buyer_phone],
        transaction_amount: params[:transaction_amount]
      }
      @payment = Payment.new(params_payment)
      @payment.save
      redirect_to order_path(params[:id])
    else
      params_payment = {
        payment_id: params[:payment_id],
        order_number: params[:order_number],
        payment_method: params[:payment_method],
        payment_status: params[:payment_status],
        receipt_url: params[:receipt_url],
        status_url: params[:status_url],
        retry_url: params[:retry_url],
        buyer_email: params[:buyer_email],
        buyer_name: params[:buyer_name],
        buyer_phone: params[:buyer_phone],
        transaction_amount: params[:transaction_amount]
      }
      @payment = Payment.new(params_payment)
      @payment.save
      redirect_to payment_path(params[:id])
    end
  end


  # POST /orders or /orders.json
  def create
    @cart = Cart.find_by(id: session[:cart_id])
    @order = Order.new(order_params)
    
    @order.total = @cart.total

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
        # redirect to payment page
        params_api = {
            buyer_email: @order.email, 
            order_number: @order.id,
            buyer_name: @order.name,
            buyer_phone: @order.phone,
            transaction_amount: @order.total,
            product_description: @order.name,
            callback_url: "",
            redirect_url: "http://localhost:3000/orders/#{@order.id}/paymentredirect",
            uid: 'd363859b-c4eb-4579-b2da-bba042ca9313',
            token: 'ayDAp2iB9zUWHUvAJ4d9',
            checksum: @order.generate_checksum,
            redirect_post: "true"
          }
          

          # Rails.logger.debug("not save")
          Rails.logger.debug("Hey total: #{params_api[:transaction_amount]}")
          Rails.logger.debug("ada tak #{params_api}")
          # flash[:alert] = "Payment success"
          redirect_post('https://sandbox.securepay.my/api/v1/payments', params: params_api)
        # format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        # format.json { render :show, status: :created, location: @order }
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