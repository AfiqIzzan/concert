class AdminsController < ApplicationController

    # GET /admins or /admins.json
    def index
        @users = User.all
        @organizers = Organizer.all
    end
    def edit
        @user = User.find(params[:id])
        @admin = Admin.find_by(user_id: params[:id])
    end
    def update
        #get admin from current user
        @admin = Admin.find_by(id: params[:id])
        # inspect admin
        Rails.logger.debug "HEY admin detected: #{@admin.inspect}"
        if @admin.update(admin_params)
            redirect_to root_path, notice: "Admin was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def edit_organizer
        @organizer = Organizer.find(params[:id])
    end
    

    


    private 

    def admin_params
        params.require(:admin).permit(:phone)
    end


end
