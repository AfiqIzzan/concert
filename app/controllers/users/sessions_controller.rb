class Users::SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]
    # # def new
    # #     super
    # # end

    # # def create 
    #     # super
    # # end

    # # def destroy
    # #     super
    # # end 

    def show
        # user is current user
        # @user = current_user
    end


    # protected
    # def configure_sign_in_params
    #     devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    # end
end