class Users::RegistrationsController < Devise::RegistrationsController
    prepend_before_action :require_no_authentication, only: [:cancel ]

    def new
      @user = User.new
    end

    #create a new user and save it to the database based on role. if current user is super admin, he will create admin
    def create
      @user = User.new(user_params)
      if user_signed_in? && current_user.role == "superadmin"
        @user.role = "admin"
      end
      Rails.logger.debug "role detected: #{@user.role}"
      if @user.save
        if @user.role == "admin"
          Admin.create(user_id: @user.id)
        end
        redirect_to user_session_path, notice: "User was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end




    private
  
    def user_params
      params.require(:user).permit( :name, :role, :email, :password, :password_confirmation)
    end
  
    def account_update_params
      params.require(:user).permit( :name, :role, :email, :password, :password_confirmation, :current_password)
    end
  end