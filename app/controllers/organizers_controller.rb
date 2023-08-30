class OrganizersController < ApplicationController

    def edit
        @organizer = Organizer.find(params[:id])
    end
    def update
        #get organizer from current user
        @organizer = Organizer.find_by(id: params[:id])
        # inspect organizer
        Rails.logger.debug "HEY organizer detected: #{@organizer}"
        if @organizer.update(organizer_params)
            redirect_to root_path, notice: "Organizer was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private 
    def organizer_params
        params.require(:organizer).permit(:email, :status, :phone, :description)
    end
end
