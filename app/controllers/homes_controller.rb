class HomesController < ApplicationController
  def index
    @events = Event.all
    @tickets = Ticket.all
  end

end
