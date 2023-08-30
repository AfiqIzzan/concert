class Organizers::SessionsController < Devise::SessionsController

    #only organizer with status = 2 can login
    def create
        if Organizer.find_by(email: params[:organizer][:email]).status == "active"
            super
        else
            redirect_to new_organizer_session_path
            flash[:notice] = "Your account is not active yet. Please contact admin for more information."

        end
    end

    

end