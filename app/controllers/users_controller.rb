class UsersController < ApplicationController
    before_action :authenticate_user!
    def homeUser
        @user = current_user
    end
end