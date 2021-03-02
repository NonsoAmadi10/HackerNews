class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        p @user

        respond_to do |format|
            if @user.save 
                format.html { redirect_to new_session_path, notice: "Account creation successful, Kindly, Login!!"}
                format.js
            else
                format.html { redirect_to new_user_path, alert: "Error! Please try again." }
                format.js
            end
        end
    end

    def show
    end

    def edit
    end

    def update
        respond_to do |format|
            if @user.update(update_profile_params)
              format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
              format.json { render :show, status: :ok, location: @user }
            else
              format.html { render :edit, alert: "#{@user.errors}" }
              format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    private 
    def user_params
        params.require(:user).permit(:fullname, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def update_profile_params
        params.require(:user).permit(:fullname, :email, :pic, :bio, :city, :address, :password)
    end
end
