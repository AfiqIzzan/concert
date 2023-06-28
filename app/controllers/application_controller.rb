class ApplicationController < ActionController::Base
    before_action :set_render_order
    before_action :initialize_order

    def set_render_order
        @render_order = true
    end

    def initialize_order
        @order ||= Order.find_by(id: session[:order_id])

        if @order.nil?
            @order = Order.create
            session[:order_id] = @order.id
        end
    end
end
