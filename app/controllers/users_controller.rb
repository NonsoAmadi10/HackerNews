class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        respond_to do |format|
            if @user.save 
                format.html { redirect_to sessions_path, notice: "Account creation successful, Kindly, Login!!"}
                format.js
            else
                format.html { redirect_to new_user_path, alert: "Error! Please try again." }
                format.js
            end
        end
    end

    private 
    def user_params
        params.require(:user).permit(:fullname, :email, :password)
    end
end
