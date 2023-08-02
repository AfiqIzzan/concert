class OrganizersController < ApplicationController
    def myEvents
        @events = Event.where(organizer_id: current_organizer.id)
    end

    def dashboard
        @events = Event.where(organizer_id: current_organizer.id)
        # calculate ticket sold based on line items quantity and current organizer's events
        @line_items = LineItem.joins(:ticket).where(tickets: {event_id: @events.ids})
        @total_ticket_sold = 0
        @line_items.each do |line_item|
            @total_ticket_sold += line_item.quantity
        end
        Rails.logger.debug("HYE total ticket sold! #{@total_ticket_sold}")
        # calculate total revenue based on line items quantity and ticket price
        @total_revenue = 0
        @line_items.each do |line_item|
            @total_revenue += line_item.quantity * line_item.ticket.price
        end
        Rails.logger.debug("HYE total revenue! #{@total_revenue}")

    end
end
  