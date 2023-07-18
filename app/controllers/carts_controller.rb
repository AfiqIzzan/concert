class CartsController < ApplicationController
    
    def add_all
        @cart = Cart.find_by(id: params[:cart_id])
        @ticket = Ticket.find_by(id: params[:ticket_id])
        @current_cart = Cart.find_by(id: session[:cart_id])

        Rails.logger.debug "Cart ID: #{@current_cart.id}"

        params[:tickets].each do |_, ticket_params| #
            ticket_id = ticket_params[:id].to_i
            ticket_quantity = ticket_params[:quantity].to_i

            next if ticket_quantity <= 0
            current_line_item = @current_cart.line_items.find_by(ticket_id: ticket_id)
            Rails.logger.debug "Current Line Item Before Save: #{current_line_item.inspect}"
            if current_line_item
                current_line_item.quantity += ticket_quantity
            else
                current_line_item = LineItem.new(ticket_id: ticket_id, quantity: ticket_quantity)
                current_line_item.cart = @current_cart
            end
            current_line_item.save
            Rails.logger.debug "Current Line Item: #{current_line_item.inspect}"
        end
        # Redirect to the cart
        redirect_to cart_path
    end

    def delete
        # Find the line item id
        @line_item = LineItem.find_by(id: params[:id])
        Rails.logger.debug "Line Item ID: #{@line_item.id}"
        @line_item.destroy
        #condition if line item is empty
        if @line_item.cart.line_items.empty?
            @line_item.cart.destroy
            session[:cart_id] = nil
            redirect_to root_path
        else
            redirect_to cart_path
        end
        
    end

        
end
