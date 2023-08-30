class Organizers::RegistrationsController < Devise::RegistrationsController

    def new
      @organizer = Organizer.new
    end

    def create
      @organizer = Organizer.new(organizer_params)
      respond_to do |format|
        if @organizer.save
          # notice user of successful sign up
          # flash[:notice] = "You have successfully signed up! We will review your application and get back to you shortly."
          # redirect_to root_path
          format.html { redirect_to new_organizer_registration_path, notice: "You have successfully signed up! We will review your application and get back to you shortly." }
          format.json { render :new }
        else
          # reload the sign up page if unsuccessful and show the errors messages
          format.html { redirect_to new_organizer_registration_path, notice: "Oops, something went wrong! Please try again" }
          format.json { render :new }
        end
      end
    end


    private
  
    def organizer_params
      params.require(:organizer).permit( :phone, :description, :status, :email, :password, :password_confirmation)
    end
  
    def account_update_params
      params.require(:organizer).permit( :phone, :description, :email, :password, :password_confirmation, :current_password)
    end
  end