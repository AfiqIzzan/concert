class OrganizersController < ApplicationController
    def myEvent
        @events = Event.where(organizer_id: current_organizer.id)
    end
end
  